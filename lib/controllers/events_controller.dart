import 'dart:convert';

import 'package:bt_app/data/models.dart';
import 'package:bt_app/utils/dio.dart';
import 'package:bt_app/utils/refresh.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bt_app/utils/database.dart';

class AsyncEventsNotifier extends AsyncNotifier<List<EventsModel>> {
  @override
  Future<List<EventsModel>> build() async {
    List<EventsModel> eventList = await _fetchAllEvents();

    return eventList;
  }

  Future<List<EventsModel>> _fetchAllEvents() async {
    final db = ref.read(AppDatabase.provider);
    final fetchedEvents = await db.getAllEvents();

    List<EventsModel> savedEntries = [];
    for (dynamic eventEntry in fetchedEvents) {
      EventsModel savedEvent = EventsModel.fromTable(eventEntry);
      savedEntries.add(savedEvent);
    }

    return savedEntries;
  }

  Future<int> getEventsCount() async {
    final eventsCount =
        await ref.read(AppDatabase.provider).eventsCount().getSingle();
    return eventsCount;
  }

  Future<List<EventsModel>> getLastEvents() async {
    final List<EventsModel> lastEvents = [];

    final List<Events> localEvents =
        await ref.read(AppDatabase.provider).getLastEvents();

    for (Events event in localEvents) {
      EventsModel entry = EventsModel.fromTable(event);
      lastEvents.add(entry);
    }

    return lastEvents;
  }

  Future<void> populateEvents() async {
    final AppDatabase db = ref.read(AppDatabase.provider);
    final Dio dio = ref.read(dioProvider);

    final response = await dio.get("https://data.blocktalk.tv/events");

    List<dynamic> fetchedEvents = response.data;

    Iterable<Events> items = fetchedEvents.map((e) {
      e["entities"] = jsonEncode(e["entities"]);
      e["url_image"] = "";
      return Events.fromJson(e);
    });
    await db.batch((batch) {
      batch.insertAll(db.eventsTable, items);
    });
  }

  Future<void> refreshEvents(bool manualRefresh) async {
    final AppDatabase db = ref.read(AppDatabase.provider);
    final Dio dio = ref.read(dioProvider);

    Map<String, DateTime> localIdToUpdated = {};

    Response<dynamic> fetchedEvents =
        await dio.get("https://data.blocktalk.tv/events");

    List<Events> localEvents = await db.getAllEvents();

    for (dynamic event in localEvents) {
      String id = event.id;
      localIdToUpdated[id] = DateTime.parse(event.updatedAt);
    }

    for (dynamic event in fetchedEvents.data) {
      String eventId = event["id"];

      if (localIdToUpdated[eventId] == null) {
        await addEvent(event, db);
        continue;
      }

      DateTime updatedAt = DateTime.parse(localIdToUpdated[eventId].toString());

      DateTime fetchedUpdatedAt = DateTime.parse(event["updated_at"]);

      if (updatedAt.isBefore(fetchedUpdatedAt)) {
        await updateEvent(event, db);
      }
    }
    if (manualRefresh) return ref.invalidate(eventsProvider);
    return ref.refresh(eventsProvider);
  }
}

final eventsProvider =
    AsyncNotifierProvider<AsyncEventsNotifier, List<EventsModel>>(() {
  return AsyncEventsNotifier();
});

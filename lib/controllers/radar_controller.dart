import 'dart:convert';

import 'package:bt_app/data/models.dart';
import 'package:bt_app/utils/dio.dart';
import 'package:bt_app/utils/refresh.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bt_app/utils/database.dart';

class AsyncRadarsNotifier extends AsyncNotifier<List<RadarsModel>> {
  @override
  Future<List<RadarsModel>> build() async {
    List<RadarsModel> eventList = await _fetchAllRadars();

    return eventList;
  }

  Future<List<RadarsModel>> _fetchAllRadars() async {
    final db = ref.read(AppDatabase.provider);
    final fetchedRadars = await db.getAllRadars();

    List<RadarsModel> savedEntries = [];
    for (dynamic radarEntry in fetchedRadars) {
      RadarsModel savedEvent = RadarsModel.fromTable(radarEntry);
      savedEntries.add(savedEvent);
    }

    return savedEntries;
  }

  Future<void> refreshRadars(bool manualRefresh) async {
    final AppDatabase db = ref.read(AppDatabase.provider);
    final Dio dio = ref.read(dioProvider);

    Map<String, DateTime> localIdToUpdated = {};

    Response<dynamic> fetchedRadars =
        await dio.get("https://data.blocktalk.tv/radar");

    List<Radars> localRadars = await db.getAllRadars();

    for (dynamic radar in localRadars) {
      String id = radar.id;
      localIdToUpdated[id] = DateTime.parse(radar.updatedAt);
    }

    for (dynamic radar in fetchedRadars.data) {
      String radarId = radar["id"];

      if (localIdToUpdated[radarId] == null) {
        await addRadar(radar, db);
        continue;
      }

      DateTime updatedAt = DateTime.parse(localIdToUpdated[radarId].toString());

      DateTime fetchedUpdatedAt = DateTime.parse(radar["updated_at"]);

      if (updatedAt.isBefore(fetchedUpdatedAt)) {
        await updateRadar(radar, db);
      }
    }
    if (manualRefresh) return ref.invalidate(radarsProvider);
    return ref.refresh(radarsProvider);
  }

  Future<void> populateRadars() async {
    final AppDatabase db = ref.read(AppDatabase.provider);
    final Dio dio = ref.read(dioProvider);

    final response = await dio.get("https://data.blocktalk.tv/radar");

    List<dynamic> fetchedRadars = response.data;

    Iterable<Radars> items = fetchedRadars.map((e) {
      e["content"] = jsonEncode(e["content"]);
      return Radars.fromJson(e);
    });
    await db.batch((batch) {
      batch.insertAll(db.radarsTable, items);
    });
  }
}

final radarsProvider =
    AsyncNotifierProvider<AsyncRadarsNotifier, List<RadarsModel>>(() {
  return AsyncRadarsNotifier();
});

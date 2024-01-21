import 'dart:math';

import 'package:bt_app/data/models.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bt_app/utils/database.dart';
import 'package:bt_app/utils/dio.dart';

class AsyncCronNotifier extends AsyncNotifier<List<CronModel>> {
  @override
  Future<List<CronModel>> build() async {
    List<CronModel> cronList = await _fetchAllCron();

    return cronList;
  }

  Future<List<CronModel>> _fetchAllCron() async {
    final db = ref.read(AppDatabase.provider);
    final fetchedCron = await db.getAllCronItems();

    List<CronModel> savedEntries = [];
    for (dynamic cronEntry in fetchedCron) {
      CronModel savedCron = CronModel.fromTable(cronEntry);
      savedEntries.add(savedCron);
    }

    return savedEntries;
  }

  Future<void> populateCron() async {
    final AppDatabase db = ref.read(AppDatabase.provider);
    final Dio dio = ref.read(dioProvider);

    final response = await dio.get("https://data.blocktalk.tv/last_updated");

    List<dynamic> fetchedCron = response.data;

    Iterable<Cron> items = fetchedCron.map((e) => Cron.fromJson({
          'id': Random().nextInt(100).toString(),
          'table_name': e["name"],
          'last_updated': DateTime.fromMillisecondsSinceEpoch(0).toString(),
          'created_at': DateTime.now().toString()
        }));
    await db.batch((batch) {
      batch.insertAll(db.cronTable, items);
    });
  }

  Future<List<CronModel>> getCronItems() async {
    final AppDatabase db = ref.read(AppDatabase.provider);
    final List<CronModel> formattedCron = [];

    List<Cron> localCron = await db.getAllCronItems();

    for (dynamic cron in localCron) {
      final CronModel cronModel = CronModel.fromTable(cron);
      formattedCron.add(cronModel);
    }

    return formattedCron;
  }

  Future populateLastUpdated() async {
    final AppDatabase db = ref.read(AppDatabase.provider);
    final Dio dio = ref.read(dioProvider);

    Response<dynamic> fetchedLastUpdated =
        await dio.get("https://data.blocktalk.tv/last_updated");

    List<Cron> localLastUpdated = await db.getAllCronItems();

    if (fetchedLastUpdated.data.length == localLastUpdated.length) return;

    List<String> foundTables = [];

    for (Cron item in localLastUpdated) {
      foundTables.add(item.name);
    }

    for (dynamic item in fetchedLastUpdated.data) {
      if (!foundTables.contains(item["name"])) {
        //! Use id on entity generation, not a random string
        //* Auto id generation is possible only if the
        //* field has an .autoIncrement(). This field is already
        //* declared as a non primary key field, so id generation
        //* is impossible at this state. Specify if you want
        //* refactorisation on all tables.
        item["id"] = Random().nextInt(100).toString() + item["name"];
        item["table_name"] = item["name"];
        item["last_updated"] = DateTime.fromMillisecondsSinceEpoch(
                int.parse(item["last_updated"].toString()))
            .toString();
        item["created_at"] = DateTime.now().toString();
        await db.addCronItem(Cron.fromJson(item));
      }
    }
  }
}

final cronProvider =
    AsyncNotifierProvider<AsyncCronNotifier, List<CronModel>>(() {
  return AsyncCronNotifier();
});

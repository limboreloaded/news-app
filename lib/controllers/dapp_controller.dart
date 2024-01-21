import 'package:bt_app/controllers/articles_controller.dart';
import 'package:bt_app/data/models.dart';
import 'package:bt_app/utils/dio.dart';
import 'package:bt_app/utils/refresh.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bt_app/utils/database.dart';

class AsyncDappsNotifier extends AsyncNotifier<List<DappsModel>> {
  @override
  Future<List<DappsModel>> build() async {
    List<DappsModel> dappList = await _fetchAllDapps();

    return dappList;
  }

  Future<List<DappsModel>> _fetchAllDapps() async {
    final db = ref.read(AppDatabase.provider);
    final fetchedDapps = await db.getAllDapps();

    List<DappsModel> savedEntries = [];
    for (dynamic dappEntry in fetchedDapps) {
      DappsModel savedDapp = DappsModel.fromTable(dappEntry);
      savedEntries.add(savedDapp);
    }

    return savedEntries;
  }

  Future<List<ArticlesModel>> fetchArticlesForEntity(String id) async {
    final List<ArticlesModel> articlesForDapp =
        await ref.read(articlesProvider.notifier).getArticlesForDapp(id);
    return articlesForDapp;
  }

  Future<List<DappsModel>> getLastDapps() async {
    final List<DappsModel> lastDapps = [];

    final List<Dapps> localDapps =
        await ref.read(AppDatabase.provider).getLastDapps();

    for (Dapps dapp in localDapps) {
      DappsModel entry = DappsModel.fromTable(dapp);
      lastDapps.add(entry);
    }

    return lastDapps;
  }

  Future<void> refreshDapps(bool manualRefresh) async {
    final AppDatabase db = ref.read(AppDatabase.provider);
    final Dio dio = ref.read(dioProvider);

    Map<String, DateTime> localIdToUpdated = {};

    Response<dynamic> fetchedDapps =
        await dio.get("https://data.blocktalk.tv/dapps");

    List<Dapps> localDapps = await db.getAllDapps();

    for (dynamic dapp in localDapps) {
      String id = dapp.id;
      localIdToUpdated[id] = DateTime.parse(dapp.updatedAt);
    }

    for (dynamic dapp in fetchedDapps.data) {
      String dappId = dapp["id"];

      if (localIdToUpdated[dappId] == null) {
        await addDapp(dapp, db);
        continue;
      }

      DateTime updatedAt = DateTime.parse(localIdToUpdated[dappId].toString());

      DateTime fetchedUpdatedAt = DateTime.parse(dapp["updated_at"]);

      if (updatedAt.isBefore(fetchedUpdatedAt)) {
        await updateDapp(dapp, db);
      }
    }
    if (manualRefresh) return ref.invalidate(dappProvider);
    return ref.refresh(dappProvider);
  }

  Future<void> populateDapps() async {
    final AppDatabase db = ref.read(AppDatabase.provider);
    final Dio dio = ref.read(dioProvider);

    final response = await dio.get("https://data.blocktalk.tv/dapps");

    List<dynamic> fetchedDapps = response.data;

    Iterable<Dapps> items = fetchedDapps.map((e) {
      return Dapps.fromJson(e);
    });
    await db.batch((batch) {
      batch.insertAll(db.dappsTable, items);
    });
  }
}

final dappProvider =
    AsyncNotifierProvider<AsyncDappsNotifier, List<DappsModel>>(() {
  return AsyncDappsNotifier();
});

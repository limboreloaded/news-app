// ignore_for_file: unused_element

import 'package:bt_app/data/models.dart';
import 'package:bt_app/utils/database.dart';
import 'package:bt_app/controllers/articles_controller.dart';
import 'package:bt_app/utils/refresh.dart';
import 'package:dio/dio.dart';
import 'package:bt_app/utils/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncNftsNotifier extends AsyncNotifier<List<NftsModel>> {
  @override
  Future<List<NftsModel>> build() async {
    return [];
  }

  Future<List<ArticlesModel>> _fetchArticlesForNft(String id) async {
    final db = ref.read(AppDatabase.provider);
    final fetchedArticles = await db.getArticlesForNft(id);

    List<ArticlesModel> savedEntries = [];
    for (dynamic newsEntry in fetchedArticles) {
      ArticlesModel savedArticle = ArticlesModel.fromTable(newsEntry);
      savedEntries.add(savedArticle);
    }

    return savedEntries;
  }

  Future<List<ArticlesModel>> fetchArticlesForEntity(String id) async {
    final List<ArticlesModel> articlesForNft =
        await ref.read(articlesProvider.notifier).getArticlesForNft(id);
    return articlesForNft;
  }

  Future<List<NftsModel>> getLastNfts() async {
    final List<NftsModel> lastNfts = [];

    final List<Nfts> localNfts =
        await ref.read(AppDatabase.provider).getLastNfts();

    for (Nfts nft in localNfts) {
      NftsModel entry = NftsModel.fromTable(nft);
      lastNfts.add(entry);
    }

    return lastNfts;
  }

  Future refreshNfts(bool manualRefresh) async {
    final AppDatabase db = ref.read(AppDatabase.provider);
    final Dio dio = ref.read(dioProvider);

    Map<String, DateTime> localIdToUpdated = {};

    Response<dynamic> fetchedNfts =
        await dio.get("https://data.blocktalk.tv/nfts");

    List<Nfts> localNfts = await db.getAllNfts();

    for (dynamic nft in localNfts) {
      String id = nft.id;
      localIdToUpdated[id] = DateTime.parse(nft.updatedAt);
    }

    for (dynamic nft in fetchedNfts.data) {
      String actionId = nft["id"];

      if (localIdToUpdated[actionId] == null) {
        await addNft(nft, db);
        continue;
      }

      DateTime updatedAt =
          DateTime.parse(localIdToUpdated[actionId].toString());

      DateTime fetchedUpdatedAt = DateTime.parse(nft["updated_at"]);

      if (updatedAt.isBefore(fetchedUpdatedAt)) {
        await updateNft(nft, db);
      }
    }
    if (manualRefresh) return ref.invalidate(nftsProvider);
    return ref.refresh(nftsProvider);
  }

  Future<void> populateNfts() async {
    final AppDatabase db = ref.read(AppDatabase.provider);
    final Dio dio = ref.read(dioProvider);

    final response = await dio.get("https://data.blocktalk.tv/nfts");

    List<dynamic> fetchedNfts = response.data;

    Iterable<Nfts> items = fetchedNfts.map((e) {
      return Nfts.fromJson(e);
    });
    await db.batch((batch) {
      batch.insertAll(db.nftsTable, items);
    });
  }
}

final nftsProvider =
    AsyncNotifierProvider<AsyncNftsNotifier, List<NftsModel>>(() {
  return AsyncNftsNotifier();
});

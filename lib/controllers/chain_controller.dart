// ignore_for_file: unused_element

import 'package:bt_app/data/models.dart';
import 'package:bt_app/utils/database.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bt_app/utils/dio.dart';
import 'package:bt_app/controllers/articles_controller.dart';

class AsyncChainsNotifier extends AsyncNotifier<List<ChainsModel>> {
  @override
  Future<List<ChainsModel>> build() async {
    return [];
  }

  Future<List<ArticlesModel>> _fetchArticlesForChain(String id) async {
    final db = ref.read(AppDatabase.provider);
    final fetchedArticles = await db.getArticlesForChain(id);

    List<ArticlesModel> savedEntries = [];
    for (dynamic newsEntry in fetchedArticles) {
      ArticlesModel savedArticle = ArticlesModel.fromTable(newsEntry);
      savedEntries.add(savedArticle);
    }

    return savedEntries;
  }

  Future<List<ArticlesModel>> fetchArticlesForEntity(String id) async {
    final List<ArticlesModel> articlesForChain =
        await ref.read(articlesProvider.notifier).getArticlesForChain(id);
    return articlesForChain;
  }

  Future<List<ChainsModel>> getLastChains() async {
    final List<ChainsModel> lastChains = [];

    final List<Chains> localChains =
        await ref.read(AppDatabase.provider).getLastChains();

    for (Chains chain in localChains) {
      ChainsModel entry = ChainsModel.fromTable(chain);
      lastChains.add(entry);
    }

    return lastChains;
  }

  Future<void> populateChains() async {
    final AppDatabase db = ref.read(AppDatabase.provider);
    final Dio dio = ref.read(dioProvider);

    final response = await dio.get("https://data.blocktalk.tv/chains");

    List<dynamic> fetchedChains = response.data;

    Iterable<Chains> items = fetchedChains.map((e) {
      return Chains.fromJson(e);
    });
    await db.batch((batch) {
      batch.insertAll(db.chainsTable, items);
    });
  }
}

final chainsProvider =
    AsyncNotifierProvider<AsyncChainsNotifier, List<ChainsModel>>(() {
  return AsyncChainsNotifier();
});

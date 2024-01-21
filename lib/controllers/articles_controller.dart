import 'package:bt_app/data/models.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bt_app/utils/database.dart';
import 'package:bt_app/utils/dio.dart';

class AsyncArticlesNotifier extends AsyncNotifier<List<ArticlesModel>> {
  @override
  Future<List<ArticlesModel>> build() async {
    final List<ArticlesModel> fetchedActions = [];

    await Future.delayed(const Duration(seconds: 1));
    return fetchedActions;
  }

  Future<List<ArticlesModel>> getArticlesForDapp(String id) async {
    final db = ref.read(AppDatabase.provider);
    final fetchedArticles = await db.getArticlesForDapp(id);

    List<ArticlesModel> savedEntries = [];
    for (dynamic articlesEntry in fetchedArticles) {
      ArticlesModel savedArticle = ArticlesModel.fromTable(articlesEntry);
      savedEntries.add(savedArticle);
    }

    return savedEntries;
  }

  Future<List<ArticlesModel>> getArticlesForNft(String id) async {
    final db = ref.read(AppDatabase.provider);
    final fetchedArticles = await db.getArticlesForNft(id);

    List<ArticlesModel> savedEntries = [];
    for (dynamic articlesEntry in fetchedArticles) {
      ArticlesModel savedArticle = ArticlesModel.fromTable(articlesEntry);
      savedEntries.add(savedArticle);
    }

    return savedEntries;
  }

  Future<List<ArticlesModel>> getArticlesForChain(String id) async {
    final db = ref.read(AppDatabase.provider);
    final fetchedArticles = await db.getArticlesForChain(id);

    List<ArticlesModel> savedEntries = [];
    for (dynamic articlesEntry in fetchedArticles) {
      ArticlesModel savedArticle = ArticlesModel.fromTable(articlesEntry);
      savedEntries.add(savedArticle);
    }

    return savedEntries;
  }

  Future<void> populateArticles() async {
    final Dio dio = ref.read(dioProvider);
    final AppDatabase db = ref.read(AppDatabase.provider);

    final response = await dio.get("https://data.blocktalk.tv/articles");

    final List fetchedArticles = response.data;

    int index = 0;

    Iterable<Articles> items = fetchedArticles.map((e) {
      e["id"] = index.toString();
      index += 1;
      return Articles.fromJson(e);
    });
    await db.batch((batch) {
      batch.insertAll(db.articlesTable, items);
    });
  }
}

final articlesProvider =
    AsyncNotifierProvider<AsyncArticlesNotifier, List<ArticlesModel>>(() {
  return AsyncArticlesNotifier();
});

import 'package:bt_app/data/models.dart';
import 'package:bt_app/utils/database.dart';
import 'package:bt_app/utils/dio.dart';
import 'package:bt_app/utils/refresh.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncNewsNotifier extends AsyncNotifier<List<NewsModel>> {
  @override
  Future<List<NewsModel>> build() async {
    final fetchedNews = await _fetchNews();

    await Future.delayed(const Duration(seconds: 1));
    return fetchedNews;
  }

  Future<int> getNewsCount() async {
    final newsCount =
        await ref.read(AppDatabase.provider).newsCount().getSingle();
    return newsCount;
  }

  Future refreshNews(bool manualRefresh) async {
    final AppDatabase db = ref.read(AppDatabase.provider);
    final Dio dio = ref.read(dioProvider);

    Map<String, DateTime> localIdToUpdated = {};

    Response<dynamic> fetchedNews =
        await dio.get("https://data.blocktalk.tv/news");

    List<News> localNews = await db.getAllNews();

    for (dynamic item in localNews) {
      String id = item.id;
      localIdToUpdated[id] = DateTime.parse(item.updatedAt);
    }

    for (dynamic item in fetchedNews.data) {
      String itemId = item["id"];

      if (localIdToUpdated[itemId] == null) {
        await addNewsArticle(item, db);
        continue;
      }
      DateTime updatedAt = DateTime.parse(localIdToUpdated[itemId].toString());

      DateTime fetchedUpdatedAt = DateTime.parse(item["updated_at"]);

      if (updatedAt.isBefore(fetchedUpdatedAt)) {
        await updateNewsArticle(item, db);
      }
    }
    if (manualRefresh) return ref.invalidate(newsProvider);
    return ref.refresh(newsProvider);
  }

  Future<void> viewNewsArticle(String id) async {
    final db = ref.read(AppDatabase.provider);
    await db.viewNews(id);
  }

  Future<List<NewsModel>> _fetchNews() async {
    final db = ref.read(AppDatabase.provider);
    final fetchedNews = await db.getAllNews();

    List<NewsModel> savedEntries = [];
    for (dynamic newsEntry in fetchedNews) {
      NewsModel savedProject = NewsModel.fromTable(newsEntry);
      savedEntries.add(savedProject);
    }

    return savedEntries;
  }

  Future<List<NewsModel>> getNewsForArticle(String id) async {
    final db = ref.read(AppDatabase.provider);
    final fetchedNews = await db.getNewsByProjectId(id);

    List<NewsModel> savedEntries = [];
    for (dynamic newsEntry in fetchedNews) {
      NewsModel savedProject = NewsModel.fromTable(newsEntry);
      savedEntries.add(savedProject);
    }

    return savedEntries;
  }

  Future<void> populateNews() async {
    final AppDatabase db = ref.read(AppDatabase.provider);
    final Dio dio = ref.read(dioProvider);

    final response = await dio.get("https://data.blocktalk.tv/news");

    List<dynamic> fetchedNews = response.data;

    Iterable<News> items = fetchedNews.map((e) {
      e["project_id"] = "0";
      return News.fromJson(e);
    });
    await db.batch((batch) {
      batch.insertAll(db.newsTable, items);
    });
  }

  void setFilteringTag(String tag) {}
}

final newsProvider =
    AsyncNotifierProvider<AsyncNewsNotifier, List<NewsModel>>(() {
  return AsyncNewsNotifier();
});

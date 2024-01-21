import 'dart:convert';

import 'package:bt_app/data/models.dart';
import 'package:bt_app/utils/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncNewsItemNotifier extends FamilyAsyncNotifier<NewsModel, String> {
  @override
  Future<NewsModel> build(String arg) async {
    final newsEntry = await _fetchNewsEntry(arg);

    return newsEntry;
  }

  Future<NewsModel> _fetchNewsEntry(String id) async {
    final db = ref.read(AppDatabase.provider);
    final newsEntry = await db.getNewsItem(arg);

    final newsEntryJson = newsEntry.toJson();
    newsEntryJson["comments"] =
        jsonDecode(newsEntryJson["comments"].toString());

    NewsModel savedEntry = NewsModel.fromJson(newsEntryJson);

    return savedEntry;
  }

  Future<void> updateNewsEntry(String id) async {
    final db = ref.read(AppDatabase.provider);
    await db.updateNewsUpdatedAt(id);
  }

  Future<void> updateNewsComments(String id, Map<String, dynamic> data) async {
    final db = ref.read(AppDatabase.provider);
    await db.updateCronItem(
        {"name": "news", "lastUpdated": DateTime.now().toString()});
    await db.updateNewsComments(id, data);
  }

  Future<bool> canUpdate() async {
    final db = ref.read(AppDatabase.provider);
    final newsCron = await db.getCronItem("news");

    DateTime now = DateTime.now();

    if (!now
        .subtract(const Duration(minutes: 5))
        .isBefore(DateTime.parse(newsCron.lastUpdated))) {
      return true;
    }
    return false;
  }
}

final newsItemFamily =
    AsyncNotifierProviderFamily<AsyncNewsItemNotifier, NewsModel, String>(() {
  return AsyncNewsItemNotifier();
});

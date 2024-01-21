import 'package:bt_app/data/models.dart';
import 'package:bt_app/utils/database.dart';
import 'package:bt_app/utils/refresh.dart';
import 'package:bt_app/utils/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncTweetsNotifier extends AsyncNotifier<List<TweetsModel>> {
  @override
  Future<List<TweetsModel>> build() async {
    final fetchedTweets = await _fetchTweets();

    await Future.delayed(const Duration(seconds: 1));
    return fetchedTweets;
  }

  Future<List<TweetsModel>> _fetchTweets() async {
    final db = ref.read(AppDatabase.provider);
    final fetchedTweets = await db.getAllTweets();

    List<TweetsModel> savedEntries = [];
    for (dynamic tweetsEntry in fetchedTweets) {
      TweetsModel savedTweet = TweetsModel.fromTable(tweetsEntry);
      savedEntries.add(savedTweet);
    }

    return savedEntries;
  }

  Future<int> getTweetsCount() async {
    final tweetsCount =
        ref.read(AppDatabase.provider).tweetsCount().getSingle();
    return tweetsCount;
  }

  Future<void> populateTweets() async {
    final AppDatabase db = ref.read(AppDatabase.provider);
    final Dio dio = ref.read(dioProvider);

    final response = await dio.get("https://data.blocktalk.tv/tweets");

    List<dynamic> fetchedTweets = response.data;

    Iterable<Tweets> items = fetchedTweets.map((e) {
      if (e["author"].toString().length > 20) {
        e["author"] = e["author"].toString().substring(0, 20);
      }
      return Tweets.fromJson(e);
    });
    await db.batch((batch) {
      batch.insertAll(db.tweetsTable, items);
    });
  }

  Future<void> refreshTweets(bool manualRefresh) async {
    final AppDatabase db = ref.read(AppDatabase.provider);
    final Dio dio = ref.read(dioProvider);

    Map<String, DateTime> localIdToUpdated = {};

    Response<dynamic> fetchedTweets =
        await dio.get("https://data.blocktalk.tv/tweets");

    List<Tweets> localTweets = await db.getAllTweets();

    for (dynamic tweet in localTweets) {
      String id = tweet.id;
      localIdToUpdated[id] = DateTime.parse(tweet.updatedAt);
    }

    for (dynamic tweet in fetchedTweets.data) {
      String tweetId = tweet["id"];

      if (tweet["author"].toString().length > 20) {
        tweet["author"] = tweet["author"].toString().substring(0, 20);
      }

      if (localIdToUpdated[tweetId] == null) {
        await addTweet(tweet, db);
        continue;
      }

      DateTime updatedAt = DateTime.parse(localIdToUpdated[tweetId].toString());

      DateTime fetchedUpdatedAt = DateTime.parse(tweet["updated_at"]);

      if (updatedAt.isBefore(fetchedUpdatedAt)) {
        await updateTweet(tweet, db);
      }
    }
    if (manualRefresh) return ref.invalidate(tweetsProvider);
    return ref.refresh(tweetsProvider);
  }
}

final tweetsProvider =
    AsyncNotifierProvider<AsyncTweetsNotifier, List<TweetsModel>>(() {
  return AsyncTweetsNotifier();
});

import 'package:bt_app/data/models.dart';
import 'package:bt_app/utils/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncTweetsItemNotifier extends FamilyAsyncNotifier<TweetsModel, String> {
  @override
  Future<TweetsModel> build(String arg) async {
    final tweetsEntry = await _fetchTweetEntry(arg);

    return tweetsEntry;
  }

  Future<TweetsModel> _fetchTweetEntry(String id) async {
    final db = ref.read(AppDatabase.provider);
    final tweetsEntry = await db.getTweetsItem(arg);

    TweetsModel savedEntry = TweetsModel.fromTable(tweetsEntry);

    return savedEntry;
  }
}

final tweetsItemFamily =
    AsyncNotifierProviderFamily<AsyncTweetsItemNotifier, TweetsModel, String>(
        () {
  return AsyncTweetsItemNotifier();
});

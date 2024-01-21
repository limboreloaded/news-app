import 'package:bt_app/data/models.dart';
import 'package:bt_app/utils/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncChainItemNotifier extends FamilyAsyncNotifier<ChainsModel, String> {
  @override
  Future<ChainsModel> build(String arg) async {
    final chainEntry = await _fetchChainEntry(arg);

    return chainEntry;
  }

  Future<ChainsModel> _fetchChainEntry(String id) async {
    final db = ref.read(AppDatabase.provider);

    final chainEntry = await db.getChainItem(id);

    ChainsModel savedEntry = ChainsModel.fromTable(chainEntry);

    return savedEntry;
  }
}

final chainItemFamily =
    AsyncNotifierProviderFamily<AsyncChainItemNotifier, ChainsModel, String>(
        () {
  return AsyncChainItemNotifier();
});

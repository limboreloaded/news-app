import 'package:bt_app/data/models.dart';
import 'package:bt_app/utils/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncDappItemNotifier extends FamilyAsyncNotifier<DappsModel, String> {
  @override
  Future<DappsModel> build(String arg) async {
    final dappEntry = await _fetchDappEntry(arg);

    return dappEntry;
  }

  Future<DappsModel> _fetchDappEntry(String id) async {
    final db = ref.read(AppDatabase.provider);

    final dappEntry = await db.getDappItem(id);

    DappsModel savedEntry = DappsModel.fromTable(dappEntry);

    return savedEntry;
  }
}

final dappItemFamily =
    AsyncNotifierProviderFamily<AsyncDappItemNotifier, DappsModel, String>(() {
  return AsyncDappItemNotifier();
});

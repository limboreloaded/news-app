import 'package:bt_app/data/models.dart';
import 'package:bt_app/utils/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncActionItemNotifier
    extends FamilyAsyncNotifier<ActionsModel, String> {
  @override
  Future<ActionsModel> build(String arg) async {
    final actionEntry = await _fetchActionEntry(arg);

    return actionEntry;
  }

  Future<ActionsModel> _fetchActionEntry(String id) async {
    final db = ref.read(AppDatabase.provider);

    final actionEntry = await db.getActionsItem(arg);

    ActionsModel savedEntry = ActionsModel.fromTable(actionEntry);

    return savedEntry;
  }
}

final actionItemFamily =
    AsyncNotifierProviderFamily<AsyncActionItemNotifier, ActionsModel, String>(
        () {
  return AsyncActionItemNotifier();
});

import 'package:bt_app/data/models.dart';
import 'package:bt_app/utils/database.dart';
import 'package:bt_app/utils/dio.dart';
import 'package:bt_app/utils/refresh.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncActionsNotifier extends AsyncNotifier<List<ActionsModel>> {
  @override
  Future<List<ActionsModel>> build() async {
    final fetchedActions = await _fetchActions();

    await Future.delayed(const Duration(seconds: 1));
    return fetchedActions;
  }

  Future<List<ActionsModel>> _fetchActions() async {
    final db = ref.read(AppDatabase.provider);

    try {
      await Future.delayed(const Duration(seconds: 1));

      List<ActionsModel> actionsList = [];
      List<dynamic> fetchedActionsList = await db.getAllActions();

      for (dynamic action in fetchedActionsList) {
        ActionsModel formattedAction = ActionsModel.fromTable(action);
        actionsList.add(formattedAction);
      }
      return actionsList;
    } catch (e) {
      return [];
    }
  }

  Future<int> getActionsCount() async {
    final int actionsCount =
        await ref.read(AppDatabase.provider).actionsCount().getSingle();
    return actionsCount;
  }

  Future<void> populateActions() async {
    final AppDatabase db = ref.read(AppDatabase.provider);
    final Dio dio = ref.read(dioProvider);

    final response = await dio.get("https://data.blocktalk.tv/actions");

    List<dynamic> fetchedActions = response.data;

    Iterable<Actions> items = fetchedActions.map((e) {
      if (e["author"].toString().length > 20) {
        e["author"] = e["author"].toString().substring(0, 20);
      }
      return Actions.fromJson(e);
    });
    await db.batch((batch) {
      batch.insertAll(db.actionsTable, items);
    });
  }

  Future<void> refreshActions(bool manualRefresh) async {
    final AppDatabase db = ref.read(AppDatabase.provider);
    final Dio dio = ref.read(dioProvider);

    Map<String, DateTime> localIdToUpdated = {};

    Response<dynamic> fetchedActions =
        await dio.get("https://data.blocktalk.tv/actions");

    List<Actions> localActions = await db.getAllActions();

    for (dynamic action in localActions) {
      String id = action.id;
      localIdToUpdated[id] = DateTime.parse(action.updatedAt);
    }

    for (dynamic action in fetchedActions.data) {
      String actionId = action["id"];

      if (action["author"].toString().length > 20) {
        action["author"] = action["author"].toString().substring(0, 20);
      }

      if (localIdToUpdated[actionId] == null) {
        await addAction(action, db);
        continue;
      }

      DateTime updatedAt =
          DateTime.parse(localIdToUpdated[actionId].toString());

      DateTime fetchedUpdatedAt = DateTime.parse(action["updated_at"]);

      if (updatedAt.isBefore(fetchedUpdatedAt)) {
        await updateAction(action, db);
      }
    }
    if (manualRefresh) return ref.invalidate(actionsProvider);
    return ref.refresh(actionsProvider);
  }

  Future<bool> canRefreshActions() async {
    final db = ref.read(AppDatabase.provider);
    final Cron actionsUpdate = await db.getCronItem("actions");

    DateTime now = DateTime.now();

    if (now
        .subtract(const Duration(minutes: 5))
        .isBefore(DateTime.parse(actionsUpdate.lastUpdated))) {
      return true;
    }
    return false;
  }
}

final actionsProvider =
    AsyncNotifierProvider<AsyncActionsNotifier, List<ActionsModel>>(() {
  return AsyncActionsNotifier();
});

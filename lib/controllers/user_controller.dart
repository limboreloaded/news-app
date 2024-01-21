import 'package:bt_app/data/models.dart';
import 'package:bt_app/utils/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends AsyncNotifier<UsersModel?> {
  @override
  Future<UsersModel?> build() async {
    final UsersModel? user = await getUser();

    return user;
  }

  Future<UsersModel?> getUser() async {
    final AppDatabase db = ref.watch(AppDatabase.provider);

    Users? user = await db.getUser();

    if (user == null) return null;

    return UsersModel.fromTable(user);
  }

  Future<void> saveUser(UsersModel user) async {
    final AppDatabase db = ref.read(AppDatabase.provider);

    await db.saveUser(user);
  }

  bool isAuthenticated() => state.value != null;
}

final userProvider = AsyncNotifierProvider<UserNotifier, UsersModel?>(() {
  return UserNotifier();
});

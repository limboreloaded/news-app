import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod/riverpod.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedPrefsProvider = Provider<SharedPrefs>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);

  return SharedPrefs(sharedPreferences);
});

class SharedPrefs {
  const SharedPrefs(this.sharedPreferences);
  final SharedPreferences sharedPreferences;

  // synchronous read
  bool showAmounts() {
    return sharedPreferences.getBool('showAmounts') ?? false;
  }

  bool enableNotifications() {
    return sharedPreferences.getBool('enableNotifications') ?? false;
  }

  bool isFirstLaunch() {
    return sharedPreferences.getBool('firstLaunch') ?? true;
  }

  String? getAccessToken() {
    return sharedPreferences.getString('accessToken');
  }

  // asynchronous write
  Future<void> setShowAmounts(bool show) {
    return sharedPreferences.setBool('showAmounts', show);
  }

  Future<void> setEnableNotifications(bool enableNotifications) {
    return sharedPreferences.setBool(
        'enableNotifications', enableNotifications);
  }

  Future<void> setFirstLaunch(bool value) {
    return sharedPreferences.setBool('firstLaunch', value);
  }

  Future<void> setAccessToken(String accessToken) {
    return sharedPreferences.setString('accessToken', accessToken);
  }
}

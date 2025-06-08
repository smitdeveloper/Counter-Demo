import 'package:shared_preferences/shared_preferences.dart';

class AppDb {
  /// this is the name of the shared preferences
  static const _dbCounterString = 'counter';

  /// this function is used to set integer value
  static Future<void> setValue(int value) async {
    final pref = await SharedPreferences.getInstance();

    await pref.setInt(_dbCounterString, value);
  }

  /// this function is used to get integer
  /// value from shared preferences
  static Future<int> getValue() async {
    final pref = await SharedPreferences.getInstance();

    return pref.getInt(_dbCounterString) ?? 0;
  }
}

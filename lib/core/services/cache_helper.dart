import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static sharedPreferencesInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future setData({required String key, required bool value}) async {
    await sharedPreferences.setBool(key, value);
  }

  static Future getData({required String key}) async {
    return sharedPreferences.getBool(key);
  }
}

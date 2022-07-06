import 'package:shared_preferences/shared_preferences.dart';

class SharePreference {
  static Future<bool> isLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLogin') ?? false;
  }

  static Future<bool> setLogin([isLogin = false]) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool('isLogin', isLogin);
  }
}

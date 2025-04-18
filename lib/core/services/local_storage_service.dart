import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _firstTimeKey = "isFirstTime";
  static const String _isLoggedInKey ="isLoggedIn";
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool getFirstTime() {
    if (_prefs == null) {
      return true;
    }
    bool value = _prefs!.getBool(_firstTimeKey) ?? true;
    return value;
  }

  static Future<void> saveFirstTime(bool value) async {
    await _prefs?.setBool(_firstTimeKey, value);
  }

  static bool isLoggedIn() {
    return _prefs?.getBool(_isLoggedInKey) ?? false;
  }

  static Future<void> saveLoginState(bool value) async {
    await _prefs?.setBool(_isLoggedInKey, value);
  }

  static Future<void> logout() async {
    await _prefs?.setBool(_isLoggedInKey, false);
    Get.offAllNamed('/Login_screen');
  }
}

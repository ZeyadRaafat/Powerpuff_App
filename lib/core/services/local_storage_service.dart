import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _firstTimeKey = "isFirstTime";
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool getFirstTime() {
    if(_prefs==null) return true;
    return _prefs!.getBool(_firstTimeKey) ?? true;
  }

  static Future<void> saveFirstTime(bool value) async {
    if(_prefs==null) return;
    await _prefs?.setBool('first_time', value);
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePrefs {
  static const THEME_STATUS = "THEMESTATUS";
  setDarkTheme({required bool value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(THEME_STATUS) ?? false;
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class WelcomeTourHelper {
  static Future<bool> getTourCompleted() async {
    SharedPreferences isCompleted = await SharedPreferences.getInstance();
    return isCompleted.getBool('tour_completed') ?? false;
  }

  static Future<void> setTourCompleted() async {
    SharedPreferences isCompleted = await SharedPreferences.getInstance();
    await isCompleted.setBool('tour_completed', true);
  }
}

class ThemePreferenceHelper {
  static const String isDarkKey = 'isDark';

  static Future<bool> getisDark() async {
    final themeperfs = await SharedPreferences.getInstance();
    return themeperfs.getBool(isDarkKey) ?? false;
  }

  static Future<void> setisDark() async {
    final themeperfs = await SharedPreferences.getInstance();
    await themeperfs.setBool(isDarkKey, true);
  }

  static Future<void> setisnotDark() async {
    final themeperfs = await SharedPreferences.getInstance();
    await themeperfs.setBool(isDarkKey, false);
  }
}

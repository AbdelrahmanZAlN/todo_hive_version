import 'package:flutter/material.dart';
import 'package:todo_final_project/services/local/cache_helper.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool isDark = false;
  String backgroundImg = "assets/images/home_screen.png";
  String mode = 'Light';
  String languageCode = 'en';
  Locale locale = const Locale('en');

  void changeAppMode({bool? fromShared}) async {
    if (fromShared != null) {
      isDark = fromShared;
      themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
      backgroundImg = isDark ? "assets/images/dark_home_screen.png" : "assets/images/home_screen.png";
      mode = isDark ? 'Dark' : 'Light';
    } else {
      isDark = !isDark;
      themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
      backgroundImg = isDark ? "assets/images/dark_home_screen.png" : "assets/images/home_screen.png";
      mode = isDark ? 'Dark' : 'Light';
      await CacheHelper.putBoolean(key: 'isDark', value: isDark);
    }
    notifyListeners();
  }

  void enableEnglish() {
    languageCode = 'en';
    locale = const Locale('en');
    notifyListeners();
  }

  void enableArabic() {
    languageCode = 'ar';
    locale = const Locale('ar');
    notifyListeners();
  }
}

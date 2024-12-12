import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;
  String backgroundImg="assets/images/home_screen.png";
  String mode='Dark';
  String languageCode='en';
  Locale locale=Locale('en');

  void enableDarkMode (){
    themeMode=ThemeMode.dark;
    backgroundImg="assets/images/dark_home_screen.png";
    notifyListeners();
    mode='Dark';
  }
  void enableLightMode (){
    themeMode= ThemeMode.light;
    backgroundImg= "assets/images/home_screen.png";
    mode='Light';
    notifyListeners();
  }
  void enableEnglish(){
    languageCode='en';
    locale=Locale('en');
    notifyListeners();
  }
  void enableArabic(){
    languageCode='ar';
    locale=Locale('ar');
    notifyListeners();
  }


}
import 'package:flutter/material.dart';
import 'package:todo_final_project/ui/constants.dart';

class MyThemeData {
  static const Color lightPrimaryColor=Color(0xFFDFECDB);



  static var lightTheme=ThemeData(
    primaryColor: lightPrimaryColor,
    primarySwatch: kPrimarySwatch,
    scaffoldBackgroundColor: Colors.transparent,

    textTheme: TextTheme(

      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),

    //App Bar Theme
    appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: Colors.blue,
    ),
  );
}
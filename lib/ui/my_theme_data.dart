// import 'package:flutter/material.dart';
//
// class MyThemeData {
//   static MaterialColor createMaterialColor(Color color) {
//     Map<int, Color> swatch = {
//       50: Color.alphaBlend(color.withOpacity(0.1), Colors.white),
//       100: Color.alphaBlend(color.withOpacity(0.2), Colors.white),
//       200: Color.alphaBlend(color.withOpacity(0.3), Colors.white),
//       300: Color.alphaBlend(color.withOpacity(0.4), Colors.white),
//       400: Color.alphaBlend(color.withOpacity(0.5), Colors.white),
//       500: color,
//       600: Color.alphaBlend(color.withOpacity(0.6), Colors.black),
//       700: Color.alphaBlend(color.withOpacity(0.7), Colors.black),
//       800: Color.alphaBlend(color.withOpacity(0.8), Colors.black),
//       900: Color.alphaBlend(color.withOpacity(0.9), Colors.black),
//     };
//     return MaterialColor(color.value, swatch);
//   }
//
//   // Define theme colors
//   static const Color lightPrimaryColor = Color(0xFFDFECDB);
//   static const Color darkPrimaryColor = Color(0xFF3450A1);
//   static const Color darkSecondaryColor = Color(0xFF041955);
//
//   // Define MaterialColor for dark swatch
//   static final MaterialColor kDarkPrimarySwatch =
//   createMaterialColor(Color(0xFFEB06FF));
//
//   static var lightTheme = ThemeData(
//     primaryColor: lightPrimaryColor,
//     primarySwatch: Colors.blue,
//     dividerColor: darkSecondaryColor,
//     scaffoldBackgroundColor: lightPrimaryColor,
//     textTheme: const TextTheme(
//       headlineMedium: TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.bold,
//         color: Colors.black,
//       ),
//       bodyMedium: TextStyle(
//         fontSize: 14,
//         fontWeight: FontWeight.bold,
//         color: Colors.black,
//       ),
//     ),
//     // App Bar Theme
//     appBarTheme: const AppBarTheme(
//       backgroundColor: Colors.blue,
//       foregroundColor: Colors.white,
//       elevation: 0,
//     ),
//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       foregroundColor: Colors.white,
//     ),
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       selectedItemColor: Colors.blue,
//     ),
//   );
//
//   static var darkTheme = ThemeData(
//     primaryColor: darkPrimaryColor,
//     primarySwatch: kDarkPrimarySwatch,
//     dividerColor: darkSecondaryColor,
//     scaffoldBackgroundColor: darkSecondaryColor,
//     textTheme: const TextTheme(
//       headlineMedium: TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.bold,
//         color: Colors.white,
//       ),
//       bodyMedium: TextStyle(
//         fontSize: 14,
//         fontWeight: FontWeight.bold,
//         color: Colors.white,
//       ),
//     ),
//     // App Bar Theme
//     appBarTheme: const AppBarTheme(
//       backgroundColor: darkSecondaryColor,
//       foregroundColor: Colors.white,
//       elevation: 0,
//     ),
//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       foregroundColor: Colors.white,
//       backgroundColor: Color(0xFFEB06FF),
//     ),
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       backgroundColor: Colors.transparent,
//       unselectedItemColor: Colors.grey,
//       elevation: 0,
//       selectedItemColor: Color(0xFFEB06FF),
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:todo_final_project/ui/constants.dart';

class MyThemeData {
  static const Color lightBackgroundColor=Color(0xFFDFECDB);
  static const Color lightPrimaryColor=Colors.white;
  static const lightSwatchColor= Colors.blue;

  static const Color darkPrimaryColor=Color(0xFF3450A1);
  static const Color darkSecondaryColor=Color(0xFF041955);
  static var darkSwatchColor= createMaterialColor(const Color(0xFFEB06FF));

  static MaterialColor createMaterialColor(Color color) {
    Map<int, Color> swatch = {
      50: Color.alphaBlend(color.withOpacity(0.1), Colors.white),
      100: Color.alphaBlend(color.withOpacity(0.2), Colors.white),
      200: Color.alphaBlend(color.withOpacity(0.3), Colors.white),
      300: Color.alphaBlend(color.withOpacity(0.4), Colors.white),
      400: Color.alphaBlend(color.withOpacity(0.5), Colors.white),
      500: color,
      600: Color.alphaBlend(color.withOpacity(0.6), Colors.black),
      700: Color.alphaBlend(color.withOpacity(0.7), Colors.black),
      800: Color.alphaBlend(color.withOpacity(0.8), Colors.black),
      900: Color.alphaBlend(color.withOpacity(0.9), Colors.black),
    };
    return MaterialColor(color.value, swatch);
  }

  static var lightTheme=ThemeData(
    primaryColor: lightPrimaryColor,
    primarySwatch: lightSwatchColor,
    dividerColor: lightSwatchColor,
    focusColor: lightSwatchColor,

    scaffoldBackgroundColor: lightBackgroundColor,

    textTheme: const TextTheme(

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
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),

    //App Bar Theme
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      toolbarTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      backgroundColor: lightSwatchColor,
      foregroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 60,

    ),
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: lightPrimaryColor
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
      backgroundColor: lightSwatchColor
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: lightPrimaryColor
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: lightSwatchColor,
    ),
  );


  static var darkTheme=ThemeData(
    primaryColor: darkPrimaryColor,
    dividerColor: darkSecondaryColor,
    primarySwatch: darkSwatchColor,
    focusColor: darkSwatchColor,

    scaffoldBackgroundColor:darkSecondaryColor,

    textTheme: const TextTheme(

      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),

    //App Bar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor:darkPrimaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: kDarkPrimarySwatch
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: darkSecondaryColor
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
        color: darkPrimaryColor
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      unselectedItemColor: Colors.grey,
      elevation: 0,
      selectedItemColor: kDarkPrimarySwatch,
    ),
  );
}
import 'package:flutter/material.dart';

class ZCLAppTheme {
  static const double minimumFontSize = 12;
  static const double bodyFontSize = 14;
  static const double smallFontSize = 16;
  static const double normalFontSize = 20;
  static const double largeFontSize = 24;
  static const double xlargeFontSize = 30;

  static final Color norTextColors = Colors.black;

  static final titleFontStyle = TextStyle(fontFamily: "Lobster");

  static final String fontFamily = "Lobster";


  static final MaterialColor white = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  );

  static final MaterialColor black = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0xFF000000),
      100: const Color(0xFF000000),
      200: const Color(0xFF000000),
      300: const Color(0xFF000000),
      400: const Color(0xFF000000),
      500: const Color(0xFF000000),
      600: const Color(0xFF000000),
      700: const Color(0xFF000000),
      800: const Color(0xFF000000),
      900: const Color(0xFF000000),
    },
  );

  static final ThemeData norTheme = ThemeData(
    primarySwatch: white,
    accentColor: Colors.white,
    canvasColor: Colors.white, // craffold backgroundcolor
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: bodyFontSize, color: Colors.black),
      headline5: TextStyle(fontSize: minimumFontSize, color: Colors.black),
      headline4: TextStyle(fontSize: smallFontSize, color: Colors.black),
      headline3: TextStyle(fontSize: normalFontSize, color: Colors.black),
      headline2: TextStyle(fontSize: largeFontSize, color: Colors.black),
      headline1: TextStyle(fontSize: xlargeFontSize, color: Colors.black),
    )
  );

  static final Color darkTextColors = Colors.green;
  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    canvasColor: Colors.grey,
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: bodyFontSize, color: Colors.black),
      headline4: TextStyle(fontSize: smallFontSize, color: Colors.black),
      headline3: TextStyle(fontSize: normalFontSize, color: Colors.black),
      headline2: TextStyle(fontSize: largeFontSize, color: Colors.black),
      headline1: TextStyle(fontSize: xlargeFontSize, color: Colors.black),
    )
  );
}
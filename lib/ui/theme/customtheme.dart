import 'package:flutter/material.dart';

class MyTheam {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme(
          primary: Colors.black,
          primaryVariant: Colors.amber,
          secondary: Colors.amberAccent,
          secondaryVariant: Colors.amber,
          surface: Colors.amber,
          background: Colors.amber,
          error: Colors.redAccent,
          onPrimary: Colors.green,
          onSecondary: Colors.cyanAccent,
          onSurface: Colors.lightGreenAccent,
          onBackground: Colors.yellow,
          onError: Colors.yellowAccent,
          brightness: Brightness.light),
      appBarTheme: AppBarTheme(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        actionsIconTheme: IconThemeData(color: Colors.black87),
      ),
      iconTheme: IconThemeData(color: Colors.black87),
      inputDecorationTheme:
          InputDecorationTheme(filled: true, fillColor: Colors.amber[200]),
      textTheme: TextTheme(
        button: TextStyle(color: Colors.black87),
        bodyText2: TextStyle(color: Colors.black87),
        bodyText1: TextStyle(color: Colors.black87),
      ),
      canvasColor: Colors.white,
      brightness: Brightness.light,
      accentColor: Colors.amber,
      accentIconTheme: IconThemeData(color: Colors.black),
      buttonColor: Colors.amber,
      cardColor: Colors.amber,
      backgroundColor: Colors.white,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      colorScheme: ColorScheme(
          primary: Colors.white,
          primaryVariant: Colors.grey,
          secondary: Colors.amberAccent,
          secondaryVariant: Colors.amber,
          surface: Colors.blue,
          background: Colors.blueGrey,
          error: Colors.redAccent,
          onPrimary: Colors.green,
          onSecondary: Colors.cyanAccent,
          onSurface: Colors.lightGreenAccent,
          onBackground: Colors.yellow,
          onError: Colors.yellowAccent,
          brightness: Brightness.dark),
      backgroundColor: Colors.blue,
      textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white54)),
      appBarTheme: AppBarTheme(backgroundColor: Colors.black),
      inputDecorationTheme: InputDecorationTheme(),
      canvasColor: Colors.black,
      brightness: Brightness.dark,
      accentColor: Colors.blueGrey,
      buttonColor: Colors.blueGrey,
      accentIconTheme: IconThemeData(color: Colors.black),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:reading_app/shared/style/color/colors.dart';

class AppTheme{
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: mainDeepBlue,
    fontFamily: "Nunito Sans",
    textTheme: TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 48.0,
        color: mainWhite
      )
    ),
    // tabBarTheme: const TabBarTheme(
    //   labelStyle: TextStyle(
    //     fontSize: 16,
    //   ),
    //   indicator: UnderlineTabIndicator(
    //     borderSide: BorderSide(color: Colors.transparent)
    //   )
    // ),
  );
}

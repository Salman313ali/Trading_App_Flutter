import 'package:flutter/material.dart';
import 'package:trading_app/src/Constants/Color.dart';
import 'Widget_themes/text_theme.dart';

class TAppTheme {

  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: TBgWhite,
    textTheme: TTextTheme.lightTextTheme,
    primarySwatch: myPrimaryColor,
  );
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    primarySwatch: myPrimaryColor,
  );
}
import 'package:flutter/material.dart';
import 'package:flutter_music/core/theme/app_pallete.dart';

class AppTheme {
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 3),
    borderRadius: BorderRadius.circular(10),
  );
  static final kDarkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.kBackgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(27),
      enabledBorder: _border(Pallete.kBorderColor),
      focusedBorder: _border(Pallete.kGradient2),
    ),
  );
}

import 'package:flutter/material.dart';

class AppThemeCustom {
  static const Color _mainLightColor = Color.fromARGB(177, 78, 53, 222);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: _mainLightColor,
      appBarTheme: const AppBarTheme(backgroundColor: _mainLightColor));
}

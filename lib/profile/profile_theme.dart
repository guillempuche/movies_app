import 'package:flutter/material.dart';

enum ProfileThemeOptions { light, dark }

class ProfileTheme {
  static ThemeData profileThemeLight() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        color: Colors.red,
        // iconTheme: IconThemeData(color: Colors.black),
      ),
      iconTheme: const IconThemeData(color: Colors.red),
      dividerColor: Colors.grey.shade900,
    );
  }

  static ThemeData profileThemeDark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        iconTheme: IconThemeData(color: Colors.red),
      ),
      iconTheme: const IconThemeData(color: Colors.red),
      dividerColor: Colors.grey.shade200,
    );
  }
}

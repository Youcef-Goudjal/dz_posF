import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  ThemeManager._init();
  static final ThemeManager _instance = ThemeManager._init();
  static ThemeManager get instance => _instance;

  /// Default theme mode
  ThemeMode themeMode = ThemeMode.system;

  /// default Theme Schema
  FlexScheme flexScheme = FlexScheme.aquaBlue;

  /// Dark Theme
  ThemeData get darkTheme => FlexThemeData.dark(
        scheme: flexScheme,
      );

  /// light Theme
  ThemeData get lightTheme => FlexThemeData.light(
        scheme: flexScheme,
      );
}

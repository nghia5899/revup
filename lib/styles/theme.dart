import 'package:flutter/material.dart';

import 'colors.dart';

enum AppTheme { Light, Dark }

String enumName(AppTheme anyEnum) {
  return anyEnum.toString().split('.')[1];
}

final appThemeData = {
  AppTheme.Light: ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: kLightColorScheme,
  ),
  AppTheme.Dark: ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: kDarkColorScheme
  ),
};

import 'package:candela_standards/candela_standard_app_profile.dart';
import 'package:flutter/material.dart';

ThemeData getTheme(
    int themeIndex, CandelaStandardAppProfile profile, BuildContext context) {
  switch (themeIndex) {
    case 0:
      switch (Theme.of(context).brightness) {
        case Brightness.light:
          return getTheme(1, profile, context);
        case Brightness.dark:
          return getTheme(2, profile, context);
      }
    case 1: //Light Theme
      return ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
            primary: profile.primary, secondary: profile.secondary),
      );
    case 2: //Dark Theme
      return ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
            primary: profile.primary, secondary: profile.secondary),
      );
    default:
      return getTheme(2, profile, context);
  }
}

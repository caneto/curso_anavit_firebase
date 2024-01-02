import 'package:flutter/material.dart';

import '../app_colors_extension.dart';
import 'light_colors.dart';

class LightTheme {
  static final theme = ThemeData(
    scaffoldBackgroundColor: LightColors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: LightColors.purple, // background (button) color
        foregroundColor: LightColors.white, // foreground (text) color
      ),
    ),
    primaryColor: LightColors.purple,
    iconTheme: const IconThemeData(color: LightColors.black),
    primaryIconTheme: const IconThemeData(color: LightColors.white),
    badgeTheme: const BadgeThemeData(backgroundColor: LightColors.pink),
    colorScheme: const ColorScheme.light(
        primary: LightColors.purple,
        onPrimary: LightColors.white,
        secondary: LightColors.yellow,
        onSecondaryContainer: LightColors.black),
    primaryTextTheme: const TextTheme(
      titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: LightColors.white,
      ),
      titleMedium: TextStyle(
        color: LightColors.white,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w500,
        color: LightColors.white,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: LightColors.purple,
      foregroundColor: LightColors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: LightColors.lightGrey,
    ),
    extensions: [
      AppColorsExtension(
        primary: LightColors.purple,
        secundary: LightColors.yellow,
        background: LightColors.white,
        otherMessageBackground: Colors.white,
        black: LightColors.black,
        onLine: LightColors.onLineGreen,
        offLine: LightColors.offLineYellow,
      ),
    ],
  );
}

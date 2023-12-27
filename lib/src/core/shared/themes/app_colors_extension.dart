import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {

  AppColorsExtension({
    required this.primary,
    required this.secundary,
    required this.background,
    required this.otherMessageBackground,
    required this.black,
    required this.onLine,
    required this.offLine,
  }) : background70 = background.withOpacity(0.7);
  
  final Color primary;
  final Color secundary;
  final Color background;
  final Color otherMessageBackground;
  final Color background70;
  final Color black;
  final Color onLine;
  final Color offLine;

  @override
  ThemeExtension<AppColorsExtension> lerp(
      covariant ThemeExtension<AppColorsExtension>? other, double t) {
    if(t > 0.5 && other != null) return other;
    throw UnimplementedError();
  }

  @override
  AppColorsExtension copyWith({
    Color? primary,
    Color? secundary,
    Color? background,
    Color? otherMessageBackground,
    Color? black,
    Color? onLine,
    Color? offLine,
  }) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      secundary: secundary ?? this.secundary,
      background: background ?? this.background,
      otherMessageBackground:
          otherMessageBackground ?? this.otherMessageBackground,
      black: black ?? this.black,
      onLine: onLine ?? this.onLine,
      offLine: offLine ?? this.offLine,
    );
  }
}

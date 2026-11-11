import 'package:flutter/material.dart';
import 'package:battlelingual/core/app_color.dart';

class AppTheme {
  AppTheme._();
  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: AppColor.accentGold,
      onPrimary: AppColor.textOnParchment,
      secondary: AppColor.primaryBlue,
      onSecondary: AppColor.textPrimary,
      tertiary: AppColor.highlightCyan,
      surface: AppColor.backgroundDark,
      onSurface: AppColor.textPrimary,
      error: AppColor.error,
      onError: AppColor.textPrimary,
    ),
  );
}

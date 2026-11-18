import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Backgrounds
  static const Color backgroundDark = Color(0xFF1B1030);
  static const Color backgroundMid = Color(0xFF3B2A7A);

  // Brand
  static const Color primaryBlue = Color(0xFF2F5FC4);
  static const Color primaryBlueLight = Color(0xFF4A8FE8);
  static const Color accentGold = Color(0xFFF2B531);
  static const Color accentAmber = Color(0xFFE5791E);

  // Highlights
  static const Color highlightCyan = Color(0xFF5CC8FF);
  static const Color highlightMagenta = Color(0xFFC2468F);

  // Status
  static const Color error = Color(0xFFD92E3A);
  static const Color success = Color(0xFF4E7A3A);

  // Parchment
  static const Color surfaceParchment = Color(0xFFF1DDB0);
  static const Color surfaceBorder = Color(0xFF8A5A2B);
  static const Color textOnParchment = Color(0xFF4A2E12);

  // Base text
  static const Color textPrimary = Color(0xFFFFFFFF);

  // Button colors
  static const Color buttonBlueLight = Color(0xFF164B91);
  static const Color buttonBlueMid = Color(0xFF08285D);
  static const Color buttonBlueDark = Color(0xFF020E2C);

  static const Color buttonCyan = Color(0xFF00B4D8);

  static const Color buttonGoldDark = Color(0xFFB87315);
  static const Color buttonGoldMid = Color(0xFFCC9301);
  static const Color buttonGold = Color(0xFFFFB703);
  static const Color buttonGoldLight = Color(0xFFFFED8A);

  static const Color buttonShadow = Color(0xA6000000);

  static const List<Color> paintedBorderColor = [
    AppColors.buttonGoldDark,
    AppColors.buttonGoldMid,
    AppColors.buttonGold,
    AppColors.buttonGoldLight,
    AppColors.buttonGold,
    AppColors.buttonGoldMid,
    AppColors.buttonGoldDark,
  ];

  static const List<Color> paintedBackgroundColor = [
    AppColors.buttonBlueLight,
    AppColors.buttonBlueMid,
    AppColors.buttonBlueDark,
  ];
}

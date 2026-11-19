import 'package:battlelingual/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;

  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final String? fontFamily;

  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;

  final double? letterSpacing;
  final double? height;

  final List<Shadow>? shadows;
  final TextDecoration decoration;

  const AppText({
    super.key,
    required this.text,
    this.color = AppColors.textPrimary,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.fontFamily,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow = TextOverflow.clip,
    this.letterSpacing,
    this.height,
    this.shadows,
    this.decoration = TextDecoration.none,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        letterSpacing: letterSpacing,
        height: height,
        shadows: shadows,
        decoration: decoration,
      ),
    );
  }
}

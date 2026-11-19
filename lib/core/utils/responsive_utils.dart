import 'package:flutter/material.dart';

class ResponsiveUtils {
  ResponsiveUtils._();

  // Reference design resolution
  static const double designWidth = 874;
  static const double designHeight = 402;

  // Responsive width
  static double width(BuildContext context, double value) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return screenWidth * (value / designWidth);
  }

  // Responsive height
  static double height(BuildContext context, double value) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return screenHeight * (value / designHeight);
  }

  // Responsive font size
  static double fontSize(BuildContext context, double value) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final scale = screenWidth / designWidth;
    return value * scale;
  }

  // Responsive uniform size
  static double scale(BuildContext context, double value) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final widthScale = screenWidth / designWidth;
    final heightScale = screenHeight / designHeight;
    return value * (widthScale < heightScale ? widthScale : heightScale);
  }

  // Responsive uniform padding (scaled proportionally)
  static EdgeInsets paddingAll(BuildContext context, double value) {
    return EdgeInsets.all(scale(context, value));
  }

  // Responsive symmetric padding
  static EdgeInsets paddingSymmetric(
    BuildContext context, {
    double horizontal = 0,
    double vertical = 0,
  }) {
    return EdgeInsets.symmetric(
      horizontal: width(context, horizontal),
      vertical: height(context, vertical),
    );
  }

  // Responsive directional padding
  static EdgeInsets paddingOnly(
    BuildContext context, {
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(
      left: width(context, left),
      top: height(context, top),
      right: width(context, right),
      bottom: height(context, bottom),
    );
  }
}

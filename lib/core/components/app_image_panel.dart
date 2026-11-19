import 'package:battlelingual/core/constants/asset_paths.dart';
import 'package:flutter/material.dart';

class AppImagePanel extends StatelessWidget {
  final String imagePath;
  final Widget? child;

  final double? width;
  final double? height;

  final BoxFit fit;
  final EdgeInsetsGeometry padding;

  const AppImagePanel({
    super.key,
    required this.imagePath,
    this.child,
    this.width,
    this.height,
    this.fit = BoxFit.fill,
    this.padding = const EdgeInsets.all(8),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Image.asset(AssetPaths.coinPanel, fit: BoxFit.contain),
          Padding(
            padding: padding,
            child: child,
          ),
        ],
      ),
    );
  }
}

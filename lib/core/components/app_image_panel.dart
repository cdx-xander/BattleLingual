
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
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: fit,
          ),
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}


import 'package:battlelingual/core/constants/asset_paths.dart';
import 'package:flutter/material.dart';

class SplashBackground extends StatelessWidget {
  const SplashBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(AssetPaths.loadingBackground,
        fit: BoxFit.cover,
      ),
    );
  }
}

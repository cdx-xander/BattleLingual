import 'package:flutter/material.dart';
import 'package:battlelingual/core/app_color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _backgroundImage(),
          _gameLogo(),
          Align(
            alignment: const Alignment(0, 0.8),
            child: Container(
              width: 400,
              height: 14, // Slightly increased height to comfortably fit the border
              decoration: BoxDecoration(
                color: AppColor.surfaceParchment,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColor.backgroundMid,
                  width: 2,
                ),
              ),
              // ClipRRect keeps the inner gold fill inside the curved borders
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  // Use FractionallySizedBox later to control progress (0.0 to 1.0)
                  child: FractionallySizedBox(
                    widthFactor: 0.6, // Example: 60% loaded
                    child: Container(
                      color: AppColor.accentGold,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Align _gameLogo() {
    return Align(
      alignment: const Alignment(0, -0.8),
      child: Image.asset(
        'assets/images/logo.png',
        width: 200,
        height: 100,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _backgroundImage() {
    return Image.asset(
      'assets/images/splash.png',
      fit: BoxFit.cover, // Changed to cover so it fills the whole screen vertically & horizontally
    );
  }
}
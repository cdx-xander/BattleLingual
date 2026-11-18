import 'package:battlelingual/core/components/app_painted_panel.dart';
import 'package:battlelingual/core/components/app_text.dart';
import 'package:battlelingual/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SignInPanel extends StatelessWidget {
  const SignInPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return AppPaintedPanel(
          outerStroke: 3,
          innerStroke: 1,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Stack(
              children: [
                Positioned(
                  top: height * 0.05,
                  left: 0,
                  right: 0,
                  height: height * 0.25,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: AppText(
                      text: 'Welcome, Adventurer!',
                      color: AppColors.accentGold,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Positioned(
                  top: height * 0.40,
                  left: width * 0.20,
                  right: width * 0.20,
                  height: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.accentGold,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                Positioned(
                  top: height * 0.50,
                  left: width * 0.05,
                  right: width * 0.05,
                  height: height * 0.40,
                  child: AppText(
                    text: 'Bind your journey to your Google account so your hard-earned vocabulary survives a reinstall or device change.',
                    color: AppColors.textPrimary,
                    fontSize: width * 0.03,
                    textAlign: TextAlign.center,
                    maxLines: 4,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

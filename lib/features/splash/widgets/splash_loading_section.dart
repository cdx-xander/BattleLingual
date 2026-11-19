
import 'package:battlelingual/core/components/app_text.dart';
import 'package:battlelingual/core/constants/app_colors.dart';
import 'package:battlelingual/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class SplashLoadingSection extends StatelessWidget {
  final double progress;
  final String status;

  const SplashLoadingSection({
    super.key,
    required this.progress,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          text: status,
          color: AppColors.textPrimary,
          fontSize: ResponsiveUtils.fontSize(context, 15),
        ),

        SizedBox(height: ResponsiveUtils.height(context, 10)),

        Container(
          height: ResponsiveUtils.height(context, 13),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.surfaceParchment,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.backgroundMid,
              width: ResponsiveUtils.width(context, 2),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: 0,
                end: progress.clamp(0.0, 1.0),
              ),
              duration: const Duration(milliseconds: 500),
              builder: (context, value, child) {
                return LinearProgressIndicator(
                  value: value,
                  backgroundColor: AppColors.surfaceParchment,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.accentGold,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

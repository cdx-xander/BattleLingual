import 'package:battlelingual/core/components/app_painted_panel.dart';
import 'package:battlelingual/core/components/app_text.dart';
import 'package:battlelingual/core/constants/app_colors.dart';
import 'package:battlelingual/core/constants/asset_paths.dart';
import 'package:battlelingual/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LobbyCharacterStats extends StatelessWidget {
  final String characterName;

  final double currentHealth;
  final double maxHealth;

  final double currentDefense;
  final double maxDefense;

  final double currentAttack;
  final double maxAttack;

  const LobbyCharacterStats({
    super.key,
    required this.characterName,
    required this.currentHealth,
    required this.maxHealth,
    required this.currentDefense,
    required this.maxDefense,
    required this.currentAttack,
    required this.maxAttack,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: ResponsiveUtils.height(context, 30),
          bottom: 0,
          left: 0,
          right: 0,
          child: AppPaintedPanel(
            cornerLength: ResponsiveUtils.height(context, 15),
            borderWidth: ResponsiveUtils.height(context, 3),
            child: Padding(
              padding: ResponsiveUtils.paddingOnly(
                context,
                top: ResponsiveUtils.height(context, 5),
                bottom: ResponsiveUtils.height(context, 1),
                right: ResponsiveUtils.height(context, 4),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // HP
                  Expanded(
                    child: _statRow(
                      context: context,
                      text: 'Health',
                      currentValue: currentHealth,
                      maxValue: maxHealth,
                      color: AppColors.error,
                      iconPath: AssetPaths.hpIcon,
                    ),
                  ),

                  // defense
                  Expanded(
                    child: _statRow(
                      context: context,
                      text: 'Defense',
                      currentValue: currentDefense,
                      maxValue: maxDefense,
                      color: AppColors.buttonBlueLight,
                      iconPath: AssetPaths.shieldIcon,
                    ),
                  ),

                  // attack
                  Expanded(
                    child: _statRow(
                      context: context,
                      text: 'Attack',
                      currentValue: currentAttack,
                      maxValue: maxAttack,
                      color: AppColors.surfaceBorder,
                      iconPath: AssetPaths.swordIcon,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Positioned(
          top: 0,
          height: ResponsiveUtils.height(context, 40),
          left: ResponsiveUtils.width(context, 20),
          right: ResponsiveUtils.width(context, 20),
          child: AppPaintedPanel(
            cornerLength: ResponsiveUtils.height(context, 15),
            borderWidth: ResponsiveUtils.height(context, 3),
            child: Center(
              child: AppText(
                text: characterName,
                fontSize: ResponsiveUtils.fontSize(context, 20),
              ),
            ),
          ),
        ),
      ],
    );
  }

  //  each value
  Widget _statRow({
    required String text,
    required double currentValue,
    required double maxValue,
    required Color color,
    required String iconPath,
    required BuildContext context,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // icons
        SvgPicture.asset(iconPath, height: ResponsiveUtils.height(context, 30)),

        // value
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // text and number value
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: text,
                    fontSize: ResponsiveUtils.fontSize(context, 13),
                  ),
                  AppText(
                    text: "$currentValue / $maxValue",
                    fontSize: ResponsiveUtils.fontSize(context, 13),
                  ),
                ],
              ),

              // LinearProgress
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  ResponsiveUtils.height(context, 5),
                ),
                child: LinearProgressIndicator(
                  minHeight: ResponsiveUtils.height(context, 5),
                  color: color,
                  backgroundColor: AppColors.textPrimary,
                  value: maxValue > 0
                      ? (currentValue / maxValue).clamp(0.0, 1.0)
                      : 0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

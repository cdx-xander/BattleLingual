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
    this.characterName = 'Levi',
    this.currentHealth = 250,
    this.maxHealth = 500,
    this.currentDefense = 250,
    this.maxDefense = 500,
    this.currentAttack = 250,
    this.maxAttack = 500,
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
              padding: ResponsiveUtils.paddingOnly(context,top: 1,bottom: 1,),
              child: Column(
                children: [
                  Expanded(
                    child: _statRow(
                      text: 'Health',
                      currentValue: currentHealth,
                      maxValue: maxHealth,
                      color: Colors.red,
                      iconPath: AssetPaths.googleIcon,
                    ),
                  ),

                  SizedBox(height: ResponsiveUtils.height(context, 20) * 0.02),

                  Expanded(
                    child: _statRow(
                      text: 'Defense',
                      currentValue: currentDefense,
                      maxValue: maxDefense,
                      color: const Color(0xFF93D792),
                      iconPath: AssetPaths.googleIcon,
                    ),
                  ),

                  SizedBox(height: ResponsiveUtils.height(context, 20) * 0.02),

                  Expanded(
                    child: _statRow(
                      text: 'Attack',
                      currentValue: currentAttack,
                      maxValue: maxAttack,
                      color: const Color(0xFF7F36F4),
                      iconPath: AssetPaths.googleIcon,
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
              child: AppText(text: characterName,
              fontSize: ResponsiveUtils.fontSize(context, 20),),
            ),
          ),
        ),
      ],
    );
  }

  Widget _statRow({
    required String text,
    required double currentValue,
    required double maxValue,
    required Color color,
    required String iconPath,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double boxWidth = constraints.maxWidth;
        final double boxHeight = constraints.maxHeight;

        return Row(
          children: [
            SvgPicture.asset(
              iconPath,
              height: boxHeight * 0.85,
              width: boxHeight * 0.85,
            ),

            SizedBox(width: boxWidth * 0.04),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: boxHeight * 0.55,
                    width: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: AppText(text: text),
                    ),
                  ),

                  SizedBox(height: boxHeight * 0.08),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      boxHeight * 0.15,
                    ),
                    child: LinearProgressIndicator(
                      minHeight: (boxHeight * 0.25).clamp(3.0, 14.0),
                      color: color,
                      backgroundColor: AppColors.surfaceParchment,
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
      },
    );
  }
}

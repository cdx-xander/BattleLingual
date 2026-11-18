
import 'package:battlelingual/core/components/app_painted_panel.dart';
import 'package:battlelingual/core/components/app_text.dart';
import 'package:battlelingual/core/constants/app_colors.dart';
import 'package:battlelingual/core/constants/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LobbyCharacterStats extends StatelessWidget {
  final double parentWidth;
  final double parentHeight;

  final String characterName;

  const LobbyCharacterStats({
    super.key,
    required this.parentWidth,
    required this.parentHeight,
    this.characterName = 'Levi',
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: parentHeight * 0.15,
          bottom: 0,
          left: 0,
          right: 0,
          child: AppPaintedPanel(
            cornerLength: parentHeight * 0.07,
            outerStroke: parentHeight * 0.015,
            child: Padding(
              padding: EdgeInsets.only(
                top: parentHeight * 0.1,
                left: parentWidth * 0.05,
                right: parentWidth * 0.05,
                bottom: parentHeight * 0.05,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: _statRow(
                      text: 'Health',
                      currentValue: 250,
                      maxValue: 500,
                      color: Colors.red,
                      iconPath: AssetPaths.googleIcon,
                    ),
                  ),

                  SizedBox(height: parentHeight * 0.02),

                  Expanded(
                    child: _statRow(
                      text: 'Defense',
                      currentValue: 250,
                      maxValue: 500,
                      color: const Color(0xFF93D792),
                      iconPath: AssetPaths.googleIcon,
                    ),
                  ),

                  SizedBox(height: parentHeight * 0.02),

                  Expanded(
                    child: _statRow(
                      text: 'Attack',
                      currentValue: 250,
                      maxValue: 500,
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
          height: parentHeight * 0.2,
          left: parentWidth * 0.1,
          right: parentWidth * 0.1,
          child: AppPaintedPanel(
            cornerLength: parentHeight * 0.07,
            outerStroke: parentHeight * 0.015,
            child: FittedBox(
              child: AppText(text: characterName),
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


import 'package:battlelingual/core/components/app_painted_panel.dart';
import 'package:battlelingual/core/components/app_text.dart';
import 'package:battlelingual/core/constants/app_colors.dart';
import 'package:battlelingual/core/constants/asset_paths.dart';
import 'package:flutter/material.dart';


class LobbyPlayerProfile extends StatelessWidget {
  final double parentWidth;
  final double parentHeight;

  final String username;
  final String profileImage;
  final double currentExp;
  final double maxExp;

  const LobbyPlayerProfile({
    super.key,
    required this.parentWidth,
    required this.parentHeight,
    this.username = 'username',
    this.profileImage = AssetPaths.profileImage,
    this.currentExp = 100,
    this.maxExp = 300,
  });

  @override
  Widget build(BuildContext context) {
    final double appPanelWidth = parentWidth * 0.8;

    return Stack(
      children: [
        Positioned(
          top: parentHeight * 0.1,
          bottom: parentHeight * 0.1,
          left: parentWidth * 0.2,
          right: 0,
          child: AppPaintedPanel(
            cornerLength: parentHeight * 0.1,
            outerStroke: parentHeight * 0.05,
            child: Stack(
              children: [
                Positioned(
                  top: parentHeight * 0.01,
                  left: appPanelWidth * 0.2,
                  height: parentHeight * 0.4,
                  width: appPanelWidth * 0.75,
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: username,
                      maxLines: 1,
                    ),
                  ),
                ),

                Positioned(
                  top: parentHeight * 0.35,
                  left: appPanelWidth * 0.2,
                  height: parentHeight * 0.25,
                  width: appPanelWidth * 0.75,
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: 'EXP   ${currentExp.toInt()}/${maxExp.toInt()}',
                      maxLines: 1,
                    ),
                  ),
                ),

                Positioned(
                  bottom: parentHeight * 0.1,
                  left: appPanelWidth * 0.2,
                  height: parentHeight * 0.07,
                  width: appPanelWidth * 0.75,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: maxExp > 0
                          ? (currentExp / maxExp).clamp(0.0, 1.0)
                          : 0,
                      minHeight: 6,
                      backgroundColor: Colors.grey,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.amber,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        Positioned(
          left: 0,
          height: parentHeight,
          width: parentHeight,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.accentGold,
                width: 2,
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                profileImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

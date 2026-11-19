import 'package:battlelingual/core/components/app_image_button.dart';
import 'package:battlelingual/core/constants/asset_paths.dart';
import 'package:battlelingual/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class LobbyButtons extends StatelessWidget {
  final VoidCallback onSettingsPressed;
  final VoidCallback onShopPressed;
  final VoidCallback onAchievementsPressed;
  final VoidCallback onLibraryPressed;
  final VoidCallback onUpgradePressed;
  final VoidCallback onPlayPressed;

  const LobbyButtons({
    super.key,
    required this.onSettingsPressed,
    required this.onShopPressed,
    required this.onAchievementsPressed,
    required this.onLibraryPressed,
    required this.onUpgradePressed,
    required this.onPlayPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // SETTINGS
        Positioned(
          top: ResponsiveUtils.height(context, 20),
          right: ResponsiveUtils.width(context, 30),
          width: ResponsiveUtils.width(context, 25),
          child: AppImageButton(
            imagePath: AssetPaths.settingsButton,
            onPressed: onSettingsPressed,
          ),
        ),

        // SHOP
        Positioned(
          top: ResponsiveUtils.height(context, 80),
          right: ResponsiveUtils.width(context, 40),
          width: ResponsiveUtils.width(context, 70),
          child: AppImageButton(
            imagePath: AssetPaths.shopButton,
            onPressed: onSettingsPressed,
          ),
        ),

        // ACHIEVEMENTS
        Positioned(
          top: ResponsiveUtils.height(context, 170),
          right: ResponsiveUtils.width(context, 40),
          width: ResponsiveUtils.width(context, 70),
          child: AppImageButton(
            imagePath: AssetPaths.achievementsButton,
            onPressed: onSettingsPressed,
          ),
        ),

        // LIBRARY
        Positioned(
          left: ResponsiveUtils.width(context, 40),
          bottom: ResponsiveUtils.height(context, 30),
          width: ResponsiveUtils.width(context, 110),
          child: AppImageButton(
            imagePath: AssetPaths.libraryButton,
            onPressed: onSettingsPressed,
          ),
        ),

        // UPGRADE
        Positioned(
          left: 0,
          right: 0,
          bottom: ResponsiveUtils.height(context, 30),
          height: ResponsiveUtils.height(context, 50),
          child: Center(
            child: AppImageButton(
              imagePath: AssetPaths.upgradeButton,
              onPressed: onSettingsPressed,
            ),
          ),
        ),

        // PLAY
        Positioned(
          right: ResponsiveUtils.width(context, 40),
          bottom: ResponsiveUtils.height(context, 30),
          width: ResponsiveUtils.width(context, 170),
          child: AppImageButton(
            imagePath: AssetPaths.playButton,
            onPressed: onSettingsPressed,
          ),
        ),
      ],
    );
  }
}

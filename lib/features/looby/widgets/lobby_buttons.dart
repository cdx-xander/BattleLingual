
import 'package:flutter/material.dart';

class LobbyButtons extends StatelessWidget {
  final double parentWidth;
  final double parentHeight;

  final VoidCallback onSettingsPressed;
  final VoidCallback onShopPressed;
  final VoidCallback onAchievementsPressed;
  final VoidCallback onLibraryPressed;
  final VoidCallback onUpgradePressed;
  final VoidCallback onPlayPressed;

  const LobbyButtons({
    super.key,
    required this.parentWidth,
    required this.parentHeight,
    required this.onSettingsPressed,
    required this.onShopPressed,
    required this.onAchievementsPressed,
    required this.onLibraryPressed,
    required this.onUpgradePressed,
    required this.onPlayPressed,
  });

  Widget _button({
    required String text,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF263B58),
        foregroundColor: Colors.white,
        side: const BorderSide(
          color: Color(0xFFD6AD54),
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          maxLines: 1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // SETTINGS
        Positioned(
          right: parentWidth * 0.05,
          top: parentHeight * 0.04,
          width: parentWidth * 0.03,
          height: parentHeight * 0.08,
          child: _button(
            text: '⚙',
            onPressed: onSettingsPressed,
          ),
        ),

        // SHOP
        Positioned(
          right: parentWidth * 0.05,
          bottom: parentHeight * 0.55,
          width: parentWidth * 0.10,
          height: parentHeight * 0.20,
          child: _button(
            text: 'Shop',
            onPressed: onShopPressed,
          ),
        ),

        // ACHIEVEMENTS
        Positioned(
          right: parentWidth * 0.05,
          bottom: parentHeight * 0.30,
          width: parentWidth * 0.10,
          height: parentHeight * 0.20,
          child: _button(
            text: 'Achievements',
            onPressed: onAchievementsPressed,
          ),
        ),

        // LIBRARY
        Positioned(
          left: parentWidth * 0.30,
          bottom: parentHeight * 0.05,
          width: parentWidth * 0.12,
          height: parentHeight * 0.18,
          child: _button(
            text: 'Library',
            onPressed: onLibraryPressed,
          ),
        ),

        // UPGRADE
        Positioned(
          left: parentWidth * 0.45,
          bottom: parentHeight * 0.05,
          width: parentWidth * 0.12,
          height: parentHeight * 0.18,
          child: _button(
            text: 'Upgrade',
            onPressed: onUpgradePressed,
          ),
        ),

        // PLAY
        Positioned(
          left: parentWidth * 0.60,
          bottom: parentHeight * 0.05,
          width: parentWidth * 0.15,
          height: parentHeight * 0.20,
          child: _button(
            text: 'PLAY',
            onPressed: onPlayPressed,
          ),
        ),
      ],
    );
  }
}

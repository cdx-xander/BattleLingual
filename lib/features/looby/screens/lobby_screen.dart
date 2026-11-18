
import 'package:battlelingual/core/constants/asset_paths.dart';
import 'package:flutter/material.dart';


import '../widgets/lobby_player_profile.dart';
import '../widgets/lobby_character_stats.dart';
import '../widgets/lobby_currency_section.dart';
import '../widgets/lobby_buttons.dart';

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double parentWidth = constraints.maxWidth;
          final double parentHeight = constraints.maxHeight;

          return Stack(
            children: [
              // BACKGROUND
              Positioned.fill(
                child: Image.asset(
                  AssetPaths.lobbyBackground,
                  fit: BoxFit.cover,
                ),
              ),

              // PLAYER PROFILE
              Positioned(
                left: parentWidth * 0.02,
                right: parentWidth * 0.77,
                top: parentHeight * 0.04,
                height: parentHeight * 0.15,
                child: LobbyPlayerProfile(
                  parentWidth: parentWidth * 0.21,
                  parentHeight: parentHeight * 0.15,
                ),
              ),

              // CHARACTER STATS
              Positioned(
                left: parentWidth * 0.02,
                right: parentWidth * 0.77,
                top: parentHeight * 0.25,
                height: parentHeight * 0.4,
                child: LobbyCharacterStats(
                  parentWidth: parentWidth * 0.21,
                  parentHeight: parentHeight * 0.4,
                ),
              ),

              // CURRENCY
              LobbyCurrencySection(
                parentWidth: parentWidth,
                parentHeight: parentHeight,
              ),

              // BUTTONS
              LobbyButtons(
                parentWidth: parentWidth,
                parentHeight: parentHeight,
                onSettingsPressed: () {
                  // TODO: Navigate to settings
                },
                onShopPressed: () {
                  // TODO: Navigate to shop
                },
                onAchievementsPressed: () {
                  // TODO: Navigate to achievements
                },
                onLibraryPressed: () {
                  // TODO: Navigate to library
                },
                onUpgradePressed: () {
                  // TODO: Navigate to upgrade
                },
                onPlayPressed: () {
                  // TODO: Navigate to battle
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

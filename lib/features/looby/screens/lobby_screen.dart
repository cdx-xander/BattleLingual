
import 'package:battlelingual/core/constants/asset_paths.dart';
import 'package:battlelingual/core/utils/responsive_utils.dart';
import 'package:battlelingual/features/looby/widgets/lobby_background.dart';
import 'package:flutter/material.dart';


import '../widgets/lobby_player_profile.dart';
import '../widgets/lobby_character_stats.dart';
import '../widgets/lobby_currency_section.dart';
import '../widgets/lobby_buttons.dart';

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {

          return Stack(
            children: [
              // BACKGROUND
              const LobbyBackground(),

              // PLAYER PROFILE
              Positioned(
                top: ResponsiveUtils.height(context, 30),
                left: ResponsiveUtils.width(context, 20),
                width: ResponsiveUtils.width(context, 220),
                height: ResponsiveUtils.height(context, 70),
                child: LobbyPlayerProfile(username: 'Alexander',currentExp: 200,maxExp: 500,profileImage: AssetPaths.profileImage,),
              ),

              // CHARACTER STATS
              Positioned(
                top: ResponsiveUtils.height(context, 120),
                left: ResponsiveUtils.width(context, 30),
                width: ResponsiveUtils.width(context, 170),
                height: ResponsiveUtils.height(context, 150),
                child: Container(color: Colors.red, child: LobbyCharacterStats()),
              ),

              // // CURRENCY
              // LobbyCurrencySection(coinAmount: '1000000000',gemAmount: '100',),

              // BUTTONS
              LobbyButtons(
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

  }
}

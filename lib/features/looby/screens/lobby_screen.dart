import 'package:battlelingual/core/constants/asset_paths.dart';
import 'package:battlelingual/core/utils/responsive_utils.dart';
import 'package:battlelingual/features/characters/controllers/character_controller.dart';
import 'package:battlelingual/features/looby/widgets/lobby_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/lobby_player_profile.dart';
import '../widgets/lobby_character_stats.dart';
import '../widgets/lobby_currency_section.dart';
import '../widgets/lobby_buttons.dart';

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CharacterController());

    return Stack(
      children: [
        // BACKGROUND
        const LobbyBackground(),

        // PLAYER PROFILE
        Positioned(
          top: ResponsiveUtils.height(context, 20),
          left: ResponsiveUtils.width(context, 20),
          width: ResponsiveUtils.width(context, 200),
          height: ResponsiveUtils.height(context, 70),
          child: LobbyPlayerProfile(
            username: 'Alexander',
            currentExp: 200,
            maxExp: 500,
            profileImage: AssetPaths.profileImage,
          ),
        ),

        // CHARACTER STATS (Reads from SQLite via GetX)
        Positioned(
          top: ResponsiveUtils.height(context, 110),
          left: ResponsiveUtils.width(context, 30),
          width: ResponsiveUtils.width(context, 170),
          height: ResponsiveUtils.height(context, 165),
          child: Obx(() {
            final character = controller.currentCharacter;
            if (controller.isLoading.value || character == null) {
              return const SizedBox.shrink();
            }
            return LobbyCharacterStats(
              characterName: character.name,
              currentAttack: character.attack.toDouble(),
              currentDefense: character.defense.toDouble(),
              currentHealth: character.health.toDouble(),
              maxAttack: character.maxAttack.toDouble(),
              maxDefense: character.maxDefense.toDouble(),
              maxHealth: character.maxHealth.toDouble(),
            );
          }),
        ),

        // CURRENCY
        Positioned(
          top: ResponsiveUtils.height(context, 20),
          right: ResponsiveUtils.width(context, 70),
          height: ResponsiveUtils.height(context, 40),
          child: const LobbyCurrencySection(
            coinAmount: '1000000000',
            gemAmount: '103253420',
          ),
        ),

        // CHARACTER DISPLAY (Reads from SQLite via GetX)
        Positioned(
          top: ResponsiveUtils.height(context, 80),
          left: ResponsiveUtils.width(context, 350),
          right: ResponsiveUtils.width(context, 350),
          height: ResponsiveUtils.height(context, 300),
          child: Obx(() {
            final character = controller.currentCharacter;
            if (controller.isLoading.value || character == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Image.asset(
                character.imagePath,
                key: ValueKey(character.id),
                fit: BoxFit.contain,
              ),
            );
          }),
        ),

        // BUTTONS
        LobbyButtons(
          onSettingsPressed: () {},
          onShopPressed: () {},
          onAchievementsPressed: () {},
          onLibraryPressed: () {},
          onUpgradePressed: () {},
          onPlayPressed: () {},
          onLeftPressed: controller.previousCharacter,
          onRightPressed: controller.nextCharacter,
        ),
      ],
    );
  }
}

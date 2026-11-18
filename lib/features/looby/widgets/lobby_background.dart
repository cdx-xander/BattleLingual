
import 'package:battlelingual/core/constants/asset_paths.dart';
import 'package:flutter/material.dart';

class LobbyBackground extends StatelessWidget {
  const LobbyBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(AssetPaths.lobbyBackground,
        fit: BoxFit.cover,
      ),
    );
  }
}

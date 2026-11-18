import 'package:battlelingual/core/constants/asset_paths.dart';
import 'package:flutter/material.dart';

class SignInLogo extends StatelessWidget {
  const SignInLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetPaths.gameLogo,
      fit: BoxFit.contain,
    );
  }
}

import 'package:flutter/material.dart';

import 'package:battlelingual/core/asset_paths.dart';
import 'package:battlelingual/widgets/currency_panel.dart';

class LobbyCurrencySection extends StatelessWidget {
  final double parentWidth;
  final double parentHeight;

  final String coinAmount;
  final String gemAmount;

  const LobbyCurrencySection({
    super.key,
    required this.parentWidth,
    required this.parentHeight,
    this.coinAmount = '1000',
    this.gemAmount = '1000',
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: parentWidth * 0.25,
          top: parentHeight * 0.02,
          width: parentWidth * 0.12,
          height: parentHeight * 0.10,
          child: CurrencyPanel(
            imagePath: AssetPaths.coinPanel,
            amount: coinAmount,
            width: parentWidth * 0.12,
            height: parentHeight * 0.10,
          ),
        ),

        Positioned(
          right: parentWidth * 0.10,
          top: parentHeight * 0.02,
          width: parentWidth * 0.12,
          height: parentHeight * 0.10,
          child: CurrencyPanel(
            imagePath: AssetPaths.gemPanel,
            amount: gemAmount,
            width: parentWidth * 0.12,
            height: parentHeight * 0.10,
          ),
        ),
      ],
    );
  }
}

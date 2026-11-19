import 'package:battlelingual/core/components/app_image_panel.dart';
import 'package:battlelingual/core/components/app_text.dart';
import 'package:battlelingual/core/constants/asset_paths.dart';
import 'package:battlelingual/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class LobbyCurrencySection extends StatelessWidget {
  final String coinAmount;
  final String gemAmount;

  const LobbyCurrencySection({
    super.key,
    required this.coinAmount,
    required this.gemAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _currencyPanel(context, coinAmount,AssetPaths.coinPanel),
        SizedBox(width: ResponsiveUtils.width(context, 10)),
        _currencyPanel(context, gemAmount, AssetPaths.gemPanel),
      ],
    );
  }

  Widget _currencyPanel(BuildContext context, amount ,imagePath) {
    return AppImagePanel(
        imagePath: imagePath,
        fit: BoxFit.contain,
        padding: ResponsiveUtils.paddingOnly(context, left: 34, top: 12, bottom: 11),
        child: AppText(
          text: amount,
          fontSize: ResponsiveUtils.fontSize(context, 12),
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
      );
  }
}

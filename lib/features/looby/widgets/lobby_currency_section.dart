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
    final double screenWidth = MediaQuery.widthOf(context);
    final double screenHeight = MediaQuery.widthOf(context);
    return Stack(
      children: [
        Positioned(
          top: screenHeight * 0.01,
          right: screenWidth * 0.1,
          width: ResponsiveUtils.width(context, 100),
          child: Container(
            color: Colors.red,
            child: AppImagePanel(
              imagePath: AssetPaths.coinPanel,
              padding: ResponsiveUtils.paddingOnly(context, left: 27, top: 6),
              child: SizedBox(
                child: AppText(
                  text: coinAmount,
                  fontSize: ResponsiveUtils.fontSize(context, 15),
                  maxLines: 1,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

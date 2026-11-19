
import 'package:battlelingual/core/components/app_painted_panel.dart';
import 'package:battlelingual/core/components/app_text.dart';
import 'package:battlelingual/core/constants/app_colors.dart';
import 'package:battlelingual/core/constants/asset_paths.dart';
import 'package:battlelingual/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';


class LobbyPlayerProfile extends StatelessWidget {

  final String username;
  final String profileImage;
  final double currentExp;
  final double maxExp;

  const LobbyPlayerProfile({
    super.key,
    this.username = 'username',
    this.profileImage = AssetPaths.profileImage,
    this.currentExp = 100,
    this.maxExp = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top:0,
          bottom:0,
          left: ResponsiveUtils.width(context, 40),
          right: 0,
          child: Padding(
            padding: ResponsiveUtils.paddingAll(context, 5),
            child: AppPaintedPanel(
              cornerLength: ResponsiveUtils.width(context, 15),
              borderWidth: ResponsiveUtils.width(context, 3),
              child: Stack(
                children: [

                  // username 
                  Positioned(
                    top: 0,
                    height: ResponsiveUtils.height(context, 20),
                    left: ResponsiveUtils.width(context, 20),
                    right: 0,
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        text: username,
                        fontSize: ResponsiveUtils.fontSize(context, 10),
                        maxLines: 1,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),

                  // exp text
                  Positioned(
                    top:ResponsiveUtils.height(context, 20),
                    left:ResponsiveUtils.width(context, 20),
                    right: 0,
                    height: ResponsiveUtils.height(context, 10),
                    child: AppText(
                      color: AppColors.accentGold,
                      text: 'EXP   ${currentExp.toInt()}/${maxExp.toInt()}',
                      maxLines: 1,
                      fontSize: ResponsiveUtils.fontSize(context, 10),
                      
                    ),
                  ),
            
                  Positioned(
                    bottom: 0,
                    left: ResponsiveUtils.width(context, 20),
                    right: ResponsiveUtils.width(context, 10),
                    height: ResponsiveUtils.height(context, 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: maxExp > 0
                            ? (currentExp / maxExp).clamp(0.0, 1.0)
                            : 0,
                        minHeight: 6,
                        backgroundColor: Colors.grey,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.accentAmber
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Positioned(
          left: 0,
          height: ResponsiveUtils.height(context, 68),
          bottom: ResponsiveUtils.height(context, 1),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.accentGold,
                width: 2,
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                profileImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

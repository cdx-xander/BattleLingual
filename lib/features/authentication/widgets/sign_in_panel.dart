import 'package:battlelingual/core/components/app_painted_panel.dart';
import 'package:battlelingual/core/components/app_text.dart';
import 'package:battlelingual/core/constants/app_colors.dart';
import 'package:battlelingual/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class SignInPanel extends StatelessWidget {
  const SignInPanel({super.key});

  @override
  Widget build(BuildContext context) {
        return AppPaintedPanel(
          padding: ResponsiveUtils.paddingOnly(context, top: 10, left: 10, right: 10,bottom: 10),
          borderWidth: ResponsiveUtils.width(context, 3),
          
          cornerLength: ResponsiveUtils.width(context, 20),
          child: Stack(
            children: [
          
          
              Positioned(
                top: 0,
                left: ResponsiveUtils.width(context, 40),
                right: ResponsiveUtils.width(context, 40),
                child: AppText(
                  text: 'Welcome, Adventurer!',
                  color: AppColors.accentGold,
                  fontWeight: FontWeight.bold,
                  fontSize: ResponsiveUtils.fontSize(context, 30),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
          
              Positioned(
                top: ResponsiveUtils.height(context, 50),
                left: ResponsiveUtils.width(context, 40),
                right: ResponsiveUtils.width(context, 40),
                height: ResponsiveUtils.height(context, 2),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.accentGold,
                  ),
                ),
              ),
          
              Positioned(
                top: ResponsiveUtils.height(context, 60),
                left: ResponsiveUtils.width(context, 10),
                right: ResponsiveUtils.width(context, 10),
                child: AppText(
                  text: 'Bind your journey to your Google account so your hard-earned vocabulary survives a reinstall or device change.',
                  color: AppColors.textPrimary,
                  fontSize: ResponsiveUtils.fontSize(context, 20),
                  textAlign: TextAlign.center,
                  maxLines: 4,
                ),
              ),
            ],
          ),
        );
    
  }
}

import 'package:battlelingual/core/components/app_painted_button.dart';
import 'package:battlelingual/core/components/app_text.dart';
import 'package:battlelingual/core/constants/app_colors.dart';
import 'package:battlelingual/core/constants/asset_paths.dart';
import 'package:battlelingual/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleSignInButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppPaintedButton(
      borderWidth: ResponsiveUtils.height(context, 3),
      cornerLength: ResponsiveUtils.width(context, 13),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AssetPaths.googleIcon, height: ResponsiveUtils.height(context, 30),),

          SizedBox(width: ResponsiveUtils.width(context, 10)),

          AppText(
            text: 'Continue with Google',
            color: AppColors.textPrimary,
            fontSize: ResponsiveUtils.fontSize(context, 20),
          ),
        ],
      ),
    );
  }
}
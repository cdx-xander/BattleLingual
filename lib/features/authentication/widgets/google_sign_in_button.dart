import 'package:battlelingual/core/components/app_painted_button.dart';
import 'package:battlelingual/core/components/app_text.dart';
import 'package:battlelingual/core/constants/app_colors.dart';
import 'package:battlelingual/core/constants/asset_paths.dart';
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
      outerStroke: 3,
      innerStroke: 1,
      cornerLength: 5,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset( AssetPaths.googleIcon,
            width: 24,
            height: 24,
          ),

          const SizedBox(width: 10),

          AppText(
            text: 'Continue with Google',
            color: AppColors.textPrimary,
            fontSize: 19,
          ),
        ],
      ),
    );
  }
}
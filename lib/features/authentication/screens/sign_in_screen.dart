import 'package:battlelingual/app/routes/app_routes.dart';
import 'package:battlelingual/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

import '../widgets/sign_in_background.dart';
import '../widgets/sign_in_logo.dart';
import '../widgets/sign_in_panel.dart';
import '../widgets/google_sign_in_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // background
          const SignInBackground(),

          // game logo
          Positioned(
            top: ResponsiveUtils.height(context, 20),
            left: 0,
            right: 0,
            height: ResponsiveUtils.height(context, 70),
            child: const SignInLogo(),
          ),

          // panel
          Positioned(
            top: ResponsiveUtils.height(context, 100),
            left: ResponsiveUtils.width(context, 200),
            right: ResponsiveUtils.width(context, 200),
            height: ResponsiveUtils.height(context, 200),
            child: const SignInPanel(),
          ),

          // button
          Positioned(
            left: ResponsiveUtils.width(context, 250),
            right: ResponsiveUtils.width(context, 250),
            height: ResponsiveUtils.height(context, 50),
            bottom: ResponsiveUtils.height(context, 40),
            child: GoogleSignInButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.lobby);
              },
            ),
          ),
        ],
      ),
    );
  }
}

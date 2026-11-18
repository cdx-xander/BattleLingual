import 'package:battlelingual/app/routes/app_routes.dart';
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          return Stack(
            fit: StackFit.expand,
            children: [
              const SignInBackground(),

              Positioned(
                top: height * 0.02,
                left: 0,
                right: 0,
                height: height * 0.15,
                child: const SignInLogo(),
              ),

              Positioned(
                top: height * 0.22,
                left: width * 0.25,
                right: width * 0.25,
                height: height * 0.50,
                child: const SignInPanel(),
              ),

              Positioned(
                bottom: height * 0.10,
                left: width * 0.25,
                right: width * 0.25,
                height: height * 0.10,
                child: GoogleSignInButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.lobby,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
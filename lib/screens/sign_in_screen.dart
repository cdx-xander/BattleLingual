import 'package:battlelingual/core/app_routes.dart';
import 'package:battlelingual/widget/app_button_panel.dart';
import 'package:battlelingual/widget/app_panel.dart';
import 'package:battlelingual/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:battlelingual/core/app_color.dart';
import 'package:flutter_svg/svg.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _backgroundImage(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_gameLogo(width: 150), _signInPanel(), _googleButton(context)],
          ),
        ],
      ),
    );
  }

  AppButtonPanel _googleButton(BuildContext context) {
    return AppButtonPanel(
      height: 35,
      width: 250,
      outerStroke: 3,
      innerStroke: 1,
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.lobbyScreen);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(3),
            child: SvgPicture.asset(
              'assets/icons/google_logo.svg',
              fit: BoxFit.fitHeight,
            ),
          ),
          AppText(
            text: 'Continue with google',
            color: AppColor.textPrimary,
            fontsize: 15,
          ),
        ],
      ),
    );
  }

  AppPanel _signInPanel() {
    return AppPanel(
      width: 250,
      height: 150,
      outerStroke: 3,
      innerStroke: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              AppText(
                text: 'Welcome, Adventurer!',
                color: AppColor.accentGold,
                fontsize: 18,
                fontweight: FontWeight.bold,
              ),
              Container(
                width: 200,
                height: 2,
                decoration: BoxDecoration(
                  color: AppColor.accentGold,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          AppText(
            text: 'Bind your journey to your Google account so your hard-earned vocabulary survives a reinstall or device change.',
            color: AppColor.textPrimary,
            fontsize: 13,
            fontweight: FontWeight.normal,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _gameLogo({required double width}) {
    return Image.asset(
      'assets/images/ui_element/game_logo.png',
      width: width,
      fit: BoxFit.fitWidth,
    );
  }

  Widget _backgroundImage() {
    return Image.asset(
      'assets/images/background/splash.png',
      fit: BoxFit.cover,
    );
  }
}

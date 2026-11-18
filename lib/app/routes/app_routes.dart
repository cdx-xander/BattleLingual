import 'package:battlelingual/features/authentication/screens/sign_in_screen.dart';
import 'package:battlelingual/features/looby/screens/lobby_screen.dart';
import 'package:battlelingual/features/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();
  static const String splash = '/';
  static const String signIn = '/sign-in';
  static const String lobby = '/lobby';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    signIn: (context) => const SignInScreen(),
    lobby: (context) => const LobbyScreen(),
  };
}

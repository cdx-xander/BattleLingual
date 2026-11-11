import 'package:flutter/material.dart';
import 'package:battlelingual/core/app_routes.dart';
import 'package:battlelingual/core/app_theme.dart';
import 'package:battlelingual/screens/splash_screen.dart';

class BattleLingualApp extends StatelessWidget{
  const BattleLingualApp({super.key});
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      initialRoute: AppRoutes.splashScreen,
      routes: {
        AppRoutes.splashScreen:(context) => SplashScreen(),
      },
    );
  }
}
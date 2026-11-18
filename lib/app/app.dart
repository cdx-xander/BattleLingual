import 'package:battlelingual/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:battlelingual/app/theme/app_theme.dart';

class BattleLingualApp extends StatelessWidget {
  const BattleLingualApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BattleLingual',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}
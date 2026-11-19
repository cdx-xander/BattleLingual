import 'package:battlelingual/app/routes/app_routes.dart';
import 'package:battlelingual/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

import '../widgets/splash_background.dart';
import '../widgets/splash_logo.dart';
import '../widgets/splash_loading_section.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double loadingProgress = 0.0;
  String loadingStatus = 'Preparing BattleLingual...';

  final List<String> loadingMessages = [
    'Loading game resources...',
    'Preparing characters...',
    'Loading battle arenas...',
    'Preparing challenges...',
    'Ready to play!',
  ];

  @override
  void initState() {
    super.initState();
    _loadMockApp();
  }

  Future<void> _loadMockApp() async {
    for (int i = 0; i < loadingMessages.length; i++) {
      await Future.delayed(const Duration(milliseconds: 600));

      if (!mounted) return;

      setState(() {
        loadingProgress = (i + 1) / loadingMessages.length;
        loadingStatus = loadingMessages[i];
      });
    }

    await Future.delayed(const Duration(milliseconds: 500));

    if (!mounted) return;

    _navigateAfterLoading();
  }

  void _navigateAfterLoading() {
    Navigator.pushReplacementNamed(context, AppRoutes.signIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [

          // game background
          const SplashBackground(),

          SafeArea(
            child: Stack(
              children: [
                // game logo
                Positioned(
                  top: ResponsiveUtils.width(context, 15),
                  left: 0,
                  right: 0,
                  height: ResponsiveUtils.height(context, 100),
                  child: const SplashLogo(),
                ),

                Positioned(
                  left: ResponsiveUtils.width(context, 50),
                  right: ResponsiveUtils.width(context, 50),
                  bottom: ResponsiveUtils.width(context, 10),
                  child: SplashLoadingSection(
                    progress: loadingProgress,
                    status: loadingStatus,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

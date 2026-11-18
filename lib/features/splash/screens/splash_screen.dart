
import 'package:battlelingual/app/routes/app_routes.dart';
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
      await Future.delayed(
        const Duration(milliseconds: 600),
      );

      if (!mounted) return;

      setState(() {
        loadingProgress = (i + 1) / loadingMessages.length;
        loadingStatus = loadingMessages[i];
      });
    }

    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    if (!mounted) return;

    _navigateAfterLoading();
  }

  void _navigateAfterLoading() {
    Navigator.pushReplacementNamed(
      context,
      AppRoutes.signIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const SplashBackground(),

          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final height = constraints.maxHeight;

                return Stack(
                  children: [
                    Positioned(
                      top: height * 0.10,
                      left: 0,
                      right: 0,
                      height: height * 0.20,
                      child: const SplashLogo(),
                    ),

                    Positioned(
                      bottom: height * 0.05,
                      left: width * 0.10,
                      right: width * 0.10,
                      child: SplashLoadingSection(
                        progress: loadingProgress,
                        status: loadingStatus,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:battlelingual/core/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:battlelingual/core/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _progress = 0.0;
  String _loadingStatus = 'Initializing...';

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  /// Runs actual startup tasks and updates the progress bar dynamically
  Future<void> _initializeGame() async {
    final List<({String label, Future<void> Function() task})> startupTasks = [
      (
        label: 'Loading audio assets...',
        task: () async {
          // Replace with real audio preloading
          await Future.delayed(const Duration(milliseconds: 500));
        },
      ),
      (
        label: 'Precaching game graphics...',
        task: () async {
          // Precache key images so they don't flicker later
          if (mounted) {
            await precacheImage(
              const AssetImage('assets/images/logo.png'),
              context,
            );
          }
        },
      ),
      (
        label: 'Fetching player save data...',
        task: () async {
          // Replace with SharedPreferences / Hive / SQLite initialization
          await Future.delayed(const Duration(milliseconds: 600));
        },
      ),
      (
        label: 'Preparing vocabulary decks...',
        task: () async {
          // Replace with JSON parsing or database queries
          await Future.delayed(const Duration(milliseconds: 500));
        },
      ),
    ];

    for (int i = 0; i < startupTasks.length; i++) {
      if (!mounted) return;

      setState(() {
        _loadingStatus = startupTasks[i].label;
      });

      await startupTasks[i].task();

      if (!mounted) return;
      setState(() {
        _progress = (i + 1) / startupTasks.length;
      });
    }

    // Brief pause at 100% so the player sees the completed bar
    await Future.delayed(const Duration(milliseconds: 250));

    if (mounted) {
      Navigator.pushReplacementNamed(context, AppRoutes.signInScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    final bool isLandscape = screenSize.width > screenSize.height;

    // Responsive dimensions with clamps so they look balanced on phones & tablets
    final double logoWidth = (screenSize.width * (isLandscape ? 0.30 : 0.55))
        .clamp(150.0, 320.0);
    final double logoHeight = (screenSize.height * 0.15).clamp(70.0, 150.0);
    final double barWidth = (screenSize.width * (isLandscape ? 0.50 : 0.78))
        .clamp(220.0, 480.0);
    final double barHeight = (screenSize.height * 0.02).clamp(12.0, 20.0);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _backgroundImage(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.06,
                vertical: screenSize.height * 0.05,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Top Logo
                  _gameLogo(width: logoWidth, height: logoHeight),

                  // Bottom Loading Bar & Status Text
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _loadingStatus,
                        style: TextStyle(
                          color: AppColor.surfaceParchment,
                          fontSize: (screenSize.width * 0.035).clamp(
                            12.0,
                            16.0,
                          ),
                          fontWeight: FontWeight.w600,
                          shadows: const [
                            Shadow(
                              blurRadius: 4,
                              color: Colors.black54,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      _loadingBar(width: barWidth, height: barHeight),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loadingBar({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColor.surfaceParchment,
        borderRadius: BorderRadius.circular(height / 2),
        border: Border.all(color: AppColor.backgroundMid, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular((height / 2) - 2),
        child: Align(
          alignment: Alignment.centerLeft,
          // TweenAnimationBuilder smoothly animates between progress jumps
          child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            tween: Tween<double>(begin: 0.0, end: _progress),
            builder: (context, animatedValue, _) {
              return FractionallySizedBox(
                widthFactor: animatedValue,
                child: Container(color: AppColor.accentGold),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _gameLogo({required double width, required double height}) {
    return Image.asset(
      'assets/images/ui_element/game_logo.png',
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }

  Widget _backgroundImage() {
    return Image.asset(
      'assets/images/background/splash.png',
      fit: BoxFit.cover,
    );
  }
}

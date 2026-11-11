import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:battlelingual/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  // Optional: hide the status bar and navigation bar
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const BattleLingualApp());
}
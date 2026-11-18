
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:battlelingual/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock screen to landscape
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(const BattleLingualApp());
}

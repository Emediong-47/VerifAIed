import 'package:flutter/material.dart';
import 'package:verif_aled/app/app_main.dart';
import 'package:verif_aled/app/di/injection.dart';
import 'package:verif_aled/app/launch_splash.dart';

void main() {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  LaunchSplash.hold(binding);
  configureDependencies();
  runApp(const AppMain());
}

import 'package:flutter/material.dart';
import 'package:verif_aled/app/routes/app_router.dart';

class AppMain extends StatelessWidget {
  AppMain({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'VerifAIed',
    );
  }
}

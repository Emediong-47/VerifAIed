import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verif_aled/app/di/injection.dart';
import 'package:verif_aled/app/launch_splash.dart';
import 'package:verif_aled/app/routes/app_router.dart';
import 'package:verif_aled/app/theme/app_theme.dart';
import 'package:verif_aled/features/auth/application/auth_bloc.dart';
import 'package:verif_aled/features/verification/application/session/verification_session_bloc.dart';

class AppMain extends StatefulWidget {
  const AppMain({super.key});

  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  final _appRouter = AppRouter(authBloc: getIt<AuthBloc>());

  @override
  void initState() {
    super.initState();
    final auth = getIt<AuthBloc>()..add(const AuthEvent.started());
    LaunchSplash.releaseWhenReady(auth);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<AuthBloc>()),
        BlocProvider.value(value: getIt<VerificationSessionBloc>()),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        title: 'VerifAIed',
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
      ),
    );
  }
}

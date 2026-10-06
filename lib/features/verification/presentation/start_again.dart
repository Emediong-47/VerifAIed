import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verif_aled/app/routes/app_router.dart';
import 'package:verif_aled/features/verification/application/session/verification_session_bloc.dart';

/// Clears the session and returns to the start of the flow.
Future<void> startAgain(BuildContext context) async {
  final session = context.read<VerificationSessionBloc>();
  // Navigate first so the current page never rebuilds with an empty session.
  await context.router.replaceAll([const GuestWelcomeRoute()]);
  session.add(const VerificationSessionEvent.reset());
}

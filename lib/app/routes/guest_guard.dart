import 'package:auto_route/auto_route.dart';
import 'package:verif_aled/app/routes/app_router.dart';
import 'package:verif_aled/features/auth/application/auth_bloc.dart';

/// Sends a user who is already verified past the guest welcome page.
///
/// Waits for the stored identity to load, so it works however quickly or
/// slowly the database answers.
class GuestGuard extends AutoRouteGuard {
  GuestGuard(this._auth);

  final AuthBloc _auth;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final state = _auth.state.status == AuthStatus.unknown
        ? await _auth.stream.firstWhere(
            (state) => state.status != AuthStatus.unknown,
          )
        : _auth.state;

    if (state.status == AuthStatus.authenticated) {
      resolver.next(false);
      await router.replaceAll([const PersonalizedWelcomeRoute()]);
    } else {
      resolver.next();
    }
  }
}

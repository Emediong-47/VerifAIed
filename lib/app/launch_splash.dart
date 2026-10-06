import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:verif_aled/features/auth/application/auth_bloc.dart';

/// Keeps the native splash screen up until the first real screen is ready,
/// so users never see a blank frame while the stored identity loads.
abstract final class LaunchSplash {
  /// Most launches resolve in milliseconds; this only guards a stuck load.
  static const maxWait = Duration(seconds: 5);

  static void hold(WidgetsBinding binding) =>
      FlutterNativeSplash.preserve(widgetsBinding: binding);

  /// Removes the splash once [auth] knows whether someone is signed in and
  /// the router has had a frame to show the right page.
  static Future<void> releaseWhenReady(
    AuthBloc auth, {
    VoidCallback remove = FlutterNativeSplash.remove,
  }) async {
    if (auth.state.status == AuthStatus.unknown) {
      // Falls through on a stall or a closed stream rather than leaving the
      // splash up for good.
      await auth.stream
          .firstWhere(
            (state) => state.status != AuthStatus.unknown,
            orElse: () => auth.state,
          )
          .timeout(maxWait, onTimeout: () => auth.state);
    }
    final binding = WidgetsBinding.instance;
    binding.addPostFrameCallback((_) => remove());
    binding.scheduleFrame();
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:verif_aled/features/verification/presentation/screens/personal_details_page.dart';
import 'package:verif_aled/features/verification/presentation/screens/guest_welcome_page.dart';
import 'package:verif_aled/features/verification/presentation/screens/select_document_page.dart';
import 'package:verif_aled/features/verification/presentation/screens/capture_document_page.dart';
import 'package:verif_aled/features/verification/presentation/screens/document_verification_page.dart';
import 'package:verif_aled/features/verification/presentation/screens/liveness_check_page.dart';
import 'package:verif_aled/features/verification/presentation/screens/face_verification_page.dart';
import 'package:verif_aled/features/verification/presentation/screens/verification_result_page.dart';
import 'package:verif_aled/features/verification/presentation/screens/personalized_welcome_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: GuestWelcomeRoute.page, initial: true),
    AutoRoute(page: PersonalDetailsRoute.page),
    AutoRoute(page: SelectDocumentRoute.page),
    AutoRoute(page: CaptureDocumentRoute.page),
    AutoRoute(page: DocumentVerificationRoute.page),
    AutoRoute(page: LivenessCheckRoute.page),
    AutoRoute(page: FaceVerificationRoute.page),
    AutoRoute(page: VerificationResultRoute.page),
    AutoRoute(page: PersonalizedWelcomeRoute.page),
  ];
}

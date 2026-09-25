import 'package:auto_route/auto_route.dart';
import 'package:verif_aled/features/verification/presentation/personal_details_page.dart';
import 'package:verif_aled/features/verification/presentation/guest_welcome_page.dart';
import 'package:verif_aled/features/verification/presentation/select_document_page.dart';
import 'package:verif_aled/features/verification/presentation/capture_document_page.dart';
import 'package:verif_aled/features/verification/presentation/document_verification_page.dart';
import 'package:verif_aled/features/verification/presentation/liveness_check_page.dart';
import 'package:verif_aled/features/verification/presentation/face_verification_page.dart';
import 'package:verif_aled/features/verification/presentation/verification_result_page.dart';
import 'package:verif_aled/features/verification/presentation/personalized_welcome_page.dart';

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

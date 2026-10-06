import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:verif_aled/features/auth/application/auth_bloc.dart';
import 'package:verif_aled/features/verification/application/session/verification_session_bloc.dart';
import 'package:verif_aled/features/verification/domain/enums/document_type.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/objects/document_verification_object.dart';
import 'package:verif_aled/features/verification/domain/objects/face_verification_object.dart';
import 'package:verif_aled/features/verification/presentation/screens/verification_result_page.dart';

import '../../../../helpers/mock_auth_bloc.dart';
import '../../../../helpers/session_fixtures.dart';

void main() {
  late VerificationSessionBloc session;
  late MockAuthBloc auth;

  setUp(() {
    session = VerificationSessionBloc();
    auth = mockAuthBloc(const AuthState(status: AuthStatus.unauthenticated));
  });

  tearDown(() => session.close());

  Future<void> pumpPage(
    WidgetTester tester,
    List<VerificationSessionEvent> events,
  ) async {
    events.forEach(session.add);
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: session),
          BlocProvider<AuthBloc>.value(value: auth),
        ],
        child: const MaterialApp(home: VerificationResultPage()),
      ),
    );
    await tester.pump();
  }

  testWidgets('a fully verified session shows success and Continue', (
    tester,
  ) async {
    // Arrange
    final events = completedSessionEvents();

    // Act
    await pumpPage(tester, events);

    // Assert
    expect(find.text('Identity verified'), findsOneWidget);
    expect(find.text('Passed'), findsNWidgets(2));
    expect(find.text('Passed · Similarity 82%'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
    expect(find.text('Start again'), findsNothing);
  });

  testWidgets('a weak face match is outlined but can still continue', (
    tester,
  ) async {
    // Arrange
    final events = completedSessionEvents(
      faceVerification: const FaceVerification(
        similarity: 0.31,
        threshold: 0.5,
      ),
    );

    // Act
    await pumpPage(tester, events);

    // Assert
    expect(find.text('Identity verified with warnings'), findsOneWidget);
    expect(
      find.text(
        'Passed with warning · Similarity 31% · ID photo may be unclear',
      ),
      findsOneWidget,
    );
    expect(find.text('Continue'), findsOneWidget);
    expect(find.text('Start again'), findsNothing);
  });

  testWidgets('a document without a date of birth is outlined', (tester) async {
    // Arrange
    final events = completedSessionEvents(
      documentVerification: const DocumentVerification(
        isDocumentTypeMatch: true,
        isNameMatch: true,
        isDateOfBirthMatch: false,
        isFaceDetected: true,
        rawText: 'STUDENT ID',
      ),
    );

    // Act
    await pumpPage(tester, events);

    // Assert
    expect(find.text('Identity verified with warnings'), findsOneWidget);
    expect(
      find.text(
        'Passed with warning · Date of birth not found on the document',
      ),
      findsOneWidget,
    );
    expect(find.text('Continue'), findsOneWidget);
  });

  testWidgets('a failed document check shows Start again', (tester) async {
    // Arrange
    final events = completedSessionEvents(
      documentVerification: passedDocumentVerification.copyWith(
        isNameMatch: false,
      ),
    );

    // Act
    await pumpPage(tester, events);

    // Assert
    expect(find.text('Verification incomplete'), findsOneWidget);
    expect(find.text('Start again'), findsOneWidget);
    expect(find.text('Continue'), findsNothing);
  });

  testWidgets('an empty session shows every check as not completed', (
    tester,
  ) async {
    // Arrange
    const events = <VerificationSessionEvent>[];

    // Act
    await pumpPage(tester, events);

    // Assert
    expect(find.text('Verification incomplete'), findsOneWidget);
    expect(find.text('Not completed'), findsNWidgets(3));
  });

  testWidgets('Continue signs the user in with the verified identity', (
    tester,
  ) async {
    // Arrange
    await pumpPage(tester, completedSessionEvents());

    // Act
    await tester.tap(find.text('Continue'));
    await tester.pump();

    // Assert
    verify(
      () => auth.add(
        AuthEvent.verificationCompleted(
          applicant: testApplicant,
          documentType: DocumentType.nin,
          selfie: const DocumentImage(path: '/tmp/selfie.jpg'),
          faceSimilarity: 0.82,
        ),
      ),
    ).called(1);
  });

  testWidgets('Continue records which checks passed with warnings', (
    tester,
  ) async {
    // Arrange
    await pumpPage(
      tester,
      completedSessionEvents(
        documentVerification: const DocumentVerification(
          isDocumentTypeMatch: true,
          isNameMatch: true,
          isDateOfBirthMatch: false,
          isFaceDetected: true,
          rawText: 'STUDENT ID',
        ),
        faceVerification: const FaceVerification(
          similarity: 0.31,
          threshold: 0.5,
        ),
      ),
    );

    // Act
    await tester.tap(find.text('Continue'));
    await tester.pump();

    // Assert
    verify(
      () => auth.add(
        AuthEvent.verificationCompleted(
          applicant: testApplicant,
          documentType: DocumentType.nin,
          selfie: const DocumentImage(path: '/tmp/selfie.jpg'),
          faceSimilarity: 0.31,
          isDateOfBirthConfirmed: false,
          isFaceMatchConfident: false,
        ),
      ),
    ).called(1);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:verif_aled/features/verification/domain/enums/liveness_action.dart';
import 'package:verif_aled/features/verification/domain/objects/face_observation_object.dart';
import 'package:verif_aled/features/verification/domain/services/liveness_evaluator.dart';

void main() {
  const evaluator = LivenessEvaluator();

  FaceObservation face({double yaw = 0, double pitch = 0, double? smile}) =>
      FaceObservation(yaw: yaw, pitch: pitch, smilingProbability: smile);

  final cases = <(String, LivenessAction, FaceObservation, bool)>[
    (
      'turned left past threshold',
      LivenessAction.lookLeft,
      face(yaw: 25),
      true,
    ),
    ('turned left too little', LivenessAction.lookLeft, face(yaw: 24.9), false),
    (
      'turned right instead of left',
      LivenessAction.lookLeft,
      face(yaw: -40),
      false,
    ),
    (
      'turned right past threshold',
      LivenessAction.lookRight,
      face(yaw: -25),
      true,
    ),
    (
      'turned right too little',
      LivenessAction.lookRight,
      face(yaw: -24.9),
      false,
    ),
    (
      'turned left instead of right',
      LivenessAction.lookRight,
      face(yaw: 40),
      false,
    ),
    ('looked up past threshold', LivenessAction.lookUp, face(pitch: 15), true),
    ('looked up too little', LivenessAction.lookUp, face(pitch: 14.9), false),
    (
      'looked down past threshold',
      LivenessAction.lookDown,
      face(pitch: -12),
      true,
    ),
    (
      'looked down too little',
      LivenessAction.lookDown,
      face(pitch: -11.9),
      false,
    ),
    (
      'looked up instead of down',
      LivenessAction.lookDown,
      face(pitch: 20),
      false,
    ),
    ('smiling confidently', LivenessAction.smile, face(smile: 0.8), true),
    ('smiling uncertainly', LivenessAction.smile, face(smile: 0.79), false),
    ('smile not classified', LivenessAction.smile, face(), false),
  ];

  for (final (description, action, observation, expected) in cases) {
    test(
      '${action.name}: $description is ${expected ? '' : 'not '}performing',
      () {
        // Arrange
        final input = observation;

        // Act
        final result = evaluator.isPerforming(action, input);

        // Assert
        expect(result, expected);
      },
    );
  }

  group('position', () {
    const centred = FaceObservation(
      yaw: 0,
      pitch: 0,
      centerX: 0.5,
      centerY: 0.5,
      faceWidth: 0.45,
    );

    final cases = <(String, FaceObservation, FacePosition)>[
      ('a centred face looking straight on', centred, FacePosition.good),
      (
        'a slight turn within tolerance',
        centred.copyWith(yaw: 12),
        FacePosition.good,
      ),
      (
        'a head still turned left',
        centred.copyWith(yaw: 12.1),
        FacePosition.turned,
      ),
      (
        'a head still turned right',
        centred.copyWith(yaw: -20),
        FacePosition.turned,
      ),
      ('a head tilted up', centred.copyWith(pitch: 15), FacePosition.turned),
      (
        'a face too small in the frame',
        centred.copyWith(faceWidth: 0.2),
        FacePosition.tooFar,
      ),
      (
        'a face filling the frame',
        centred.copyWith(faceWidth: 0.8),
        FacePosition.tooClose,
      ),
      (
        'a face off to one side',
        centred.copyWith(centerX: 0.75),
        FacePosition.offCentre,
      ),
      (
        'a face too high',
        centred.copyWith(centerY: 0.25),
        FacePosition.offCentre,
      ),
      (
        'a face just inside the tolerance',
        centred.copyWith(centerX: 0.67, centerY: 0.33),
        FacePosition.good,
      ),
      (
        'a turned face that is also too far',
        centred.copyWith(yaw: 30, faceWidth: 0.1),
        FacePosition.turned,
      ),
      (
        'a face with unknown position',
        const FaceObservation(yaw: 0, pitch: 0),
        FacePosition.good,
      ),
    ];

    for (final (description, observation, expected) in cases) {
      test('$description is ${expected.name}', () {
        // Arrange
        final input = observation;

        // Act
        final result = evaluator.position(input);

        // Assert
        expect(result, expected);
      });
    }
  });
}

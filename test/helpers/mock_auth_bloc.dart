import 'package:mocktail/mocktail.dart';
import 'package:verif_aled/features/auth/application/auth_bloc.dart';

class MockAuthBloc extends Mock implements AuthBloc {}

/// A mock that stays in [state]; tests verify the events it receives.
MockAuthBloc mockAuthBloc(AuthState state) {
  final bloc = MockAuthBloc();
  when(() => bloc.state).thenReturn(state);
  when(() => bloc.stream).thenAnswer((_) => const Stream.empty());
  when(() => bloc.close()).thenAnswer((_) async {});
  return bloc;
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verif_aled/app/di/injection.dart';
import 'package:verif_aled/core/widgets/flow_scaffold.dart';
import 'package:verif_aled/features/verification/application/personal_details/personal_details_bloc.dart';
import 'package:verif_aled/features/verification/presentation/widgets/form_widget.dart';

@RoutePage()
class PersonalDetailsPage extends StatelessWidget {
  const PersonalDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PersonalDetailsBloc>(),
      child: const FlowScaffold(
        title: 'Personal Details',
        step: 1,
        heading: 'Tell us about yourself',
        subtitle: 'Enter your name exactly as it appears on your ID.',
        child: FormWidget(),
      ),
    );
  }
}

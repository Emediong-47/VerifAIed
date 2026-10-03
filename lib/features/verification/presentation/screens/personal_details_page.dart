import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:verif_aled/features/verification/presentation/widgets/form_widget.dart';

@RoutePage()
class PersonalDetailsPage extends StatelessWidget {
  const PersonalDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Details'),
      ),
      body: const FormWidget(),
    );
  }
}

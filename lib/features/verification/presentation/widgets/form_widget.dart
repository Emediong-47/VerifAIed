import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verif_aled/app/routes/app_router.dart';
import 'package:verif_aled/core/utils/date_format.dart';
import 'package:verif_aled/core/utils/form_status.dart';
import 'package:verif_aled/features/verification/application/personal_details/personal_details_bloc.dart';
import 'package:verif_aled/features/verification/application/session/verification_session_bloc.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final dateController = TextEditingController();

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  Future<void> selectDate() async {
    final bloc = context.read<PersonalDetailsBloc>();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: bloc.state.dateOfBirth ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      dateController.text = formatDate(pickedDate);
      bloc.add(PersonalDetailsEvent.dateOfBirthChanged(pickedDate));
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PersonalDetailsBloc>();

    return BlocConsumer<PersonalDetailsBloc, PersonalDetailsState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == FormStatus.success,
      listener: (context, state) {
        context.read<VerificationSessionBloc>().add(
          VerificationSessionEvent.applicantSubmitted(state.applicant!),
        );
        context.router.push(const SelectDocumentRoute());
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'First Name',
                prefixIcon: const Icon(Icons.person_outline_rounded),
                errorText: state.firstNameError,
              ),
              onChanged: (value) =>
                  bloc.add(PersonalDetailsEvent.firstNameChanged(value)),
            ),
            const SizedBox(height: 16),
            TextField(
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Middle Name (optional)',
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
              onChanged: (value) =>
                  bloc.add(PersonalDetailsEvent.middleNameChanged(value)),
            ),
            const SizedBox(height: 16),
            TextField(
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: 'Last Name',
                prefixIcon: const Icon(Icons.person_outline_rounded),
                errorText: state.lastNameError,
              ),
              onChanged: (value) =>
                  bloc.add(PersonalDetailsEvent.lastNameChanged(value)),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: dateController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                hintText: 'Select your date of birth',
                prefixIcon: const Icon(Icons.cake_outlined),
                suffixIcon: const Icon(Icons.calendar_today_rounded),
                errorText: state.dateOfBirthError,
              ),
              onTap: selectDate,
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: () => bloc.add(const PersonalDetailsEvent.submitted()),
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }
}

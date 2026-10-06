import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verif_aled/app/di/injection.dart';
import 'package:verif_aled/app/routes/app_router.dart';
import 'package:verif_aled/core/utils/form_status.dart';
import 'package:verif_aled/core/widgets/flow_scaffold.dart';
import 'package:verif_aled/features/verification/application/document_selection/document_selection_bloc.dart';
import 'package:verif_aled/features/verification/application/session/verification_session_bloc.dart';
import 'package:verif_aled/features/verification/domain/enums/document_type.dart';
import 'package:verif_aled/features/verification/presentation/widgets/document_type_ui.dart';

@RoutePage()
class SelectDocumentPage extends StatelessWidget {
  const SelectDocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DocumentSelectionBloc>(),
      child: BlocConsumer<DocumentSelectionBloc, DocumentSelectionState>(
        listenWhen: (previous, current) =>
            previous.status != current.status &&
            current.status == FormStatus.success,
        listener: (context, state) {
          context.read<VerificationSessionBloc>().add(
            VerificationSessionEvent.documentTypeSelected(state.selected),
          );
          context.router.push(const CaptureDocumentRoute());
        },
        builder: (context, state) {
          final bloc = context.read<DocumentSelectionBloc>();
          return FlowScaffold(
            title: 'Select Document',
            step: 2,
            heading: 'Choose your document',
            subtitle: 'Pick the ID you have with you right now.',
            actions: [
              FilledButton(
                onPressed: () =>
                    bloc.add(const DocumentSelectionEvent.submitted()),
                child: const Text('Continue'),
              ),
            ],
            child: Column(
              children: [
                for (final type in DocumentType.values) ...[
                  _DocumentOption(
                    type: type,
                    selected: type == state.selected,
                    onTap: () => bloc.add(
                      DocumentSelectionEvent.documentTypeChanged(type),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

class _DocumentOption extends StatelessWidget {
  const _DocumentOption({
    required this.type,
    required this.selected,
    required this.onTap,
  });

  final DocumentType type;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Semantics(
      selected: selected,
      button: true,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: selected ? scheme.primaryContainer : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: selected ? scheme.primary : scheme.outlineVariant,
            width: selected ? 2 : 1,
          ),
        ),
        child: ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          leading: Icon(type.icon, size: 32, color: scheme.primary),
          title: Text(
            type.label,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(type.description),
          trailing: Icon(
            selected
                ? Icons.radio_button_checked_rounded
                : Icons.radio_button_off_rounded,
            color: selected ? scheme.primary : scheme.outline,
          ),
        ),
      ),
    );
  }
}

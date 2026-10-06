import 'dart:io';

import 'package:flutter/material.dart';
import 'package:verif_aled/core/widgets/status_colors.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';

/// The liveness selfie in a circle, or a person icon when there is none.
class SelfieAvatar extends StatelessWidget {
  const SelfieAvatar({
    super.key,
    required this.selfie,
    this.radius = 20,
    this.verified = false,
  });

  final DocumentImage? selfie;
  final double radius;

  /// Adds a verified badge to the bottom-right of the avatar.
  final bool verified;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final fallback = Icon(Icons.person, size: radius);
    final photo = selfie;
    final avatar = CircleAvatar(
      radius: radius,
      backgroundColor: scheme.primaryContainer,
      child: photo == null
          ? fallback
          : ClipOval(
              child: Image.file(
                File(photo.path),
                width: radius * 2,
                height: radius * 2,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => fallback,
              ),
            ),
    );
    if (!verified) return avatar;

    final badge = radius * 0.6;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        avatar,
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: badge,
            height: badge,
            decoration: BoxDecoration(
              color: StatusColors.of(context).success,
              shape: BoxShape.circle,
              border: Border.all(color: scheme.surface, width: 3),
            ),
            child: Icon(
              Icons.check_rounded,
              size: badge * 0.6,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

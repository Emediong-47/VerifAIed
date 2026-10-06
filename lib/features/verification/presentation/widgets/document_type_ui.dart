import 'package:flutter/material.dart';
import 'package:verif_aled/features/verification/domain/enums/document_type.dart';

/// How each document type is presented on screen.
extension DocumentTypeUi on DocumentType {
  IconData get icon => switch (this) {
    DocumentType.nin => Icons.badge_outlined,
    DocumentType.studentId => Icons.school_outlined,
    DocumentType.votersCard => Icons.how_to_vote_outlined,
  };

  String get description => switch (this) {
    DocumentType.nin => 'National Identification Number slip or card',
    DocumentType.studentId => 'Card issued by your school or university',
    DocumentType.votersCard => 'Permanent Voter\'s Card from INEC',
  };
}

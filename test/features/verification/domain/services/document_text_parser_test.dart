import 'package:flutter_test/flutter_test.dart';
import 'package:verif_aled/features/verification/domain/services/document_text_parser.dart';

import '../../../../fixtures/ocr_samples.dart';

void main() {
  const parser = DocumentTextParser();

  group('normalize', () {
    test('upper-cases and collapses punctuation into single spaces', () {
      // Arrange
      const text = "  Voter's   card:\nEshiet, Emediong ";

      // Act
      final result = parser.normalize(text);

      // Assert
      expect(result, 'VOTER S CARD ESHIET EMEDIONG');
    });
  });

  group('words', () {
    test('returns the set of normalized words', () {
      // Arrange
      const text = 'Emediong U. Eshiet';

      // Act
      final result = parser.words(text);

      // Assert
      expect(result, {'EMEDIONG', 'U', 'ESHIET'});
    });

    test('returns an empty set for blank text', () {
      // Arrange
      const text = '  \n ';

      // Act
      final result = parser.words(text);

      // Assert
      expect(result, isEmpty);
    });
  });

  group('extractDates', () {
    final supportedFormats = {
      '20/05/2000': DateTime(2000, 5, 20),
      '20-05-2000': DateTime(2000, 5, 20),
      '20.05.2000': DateTime(2000, 5, 20),
      '2/5/2000': DateTime(2000, 5, 2),
      '2000-05-20': DateTime(2000, 5, 20),
      '20 MAY 2000': DateTime(2000, 5, 20),
      '20-May-2000': DateTime(2000, 5, 20),
      '3 September 1999': DateTime(1999, 9, 3),
      '3 SEPT 1999': DateTime(1999, 9, 3),
      '3 Sep, 1999': DateTime(1999, 9, 3),
    };

    for (final MapEntry(key: text, value: expected)
        in supportedFormats.entries) {
      test('parses "$text"', () {
        // Arrange
        final input = 'Some label $text trailing';

        // Act
        final result = parser.extractDates(input);

        // Assert
        expect(result, [expected]);
      });
    }

    test('returns dates in the order they appear', () {
      // Arrange
      const text = 'Issued 12 JAN 2021\nBorn 20/05/2000\nExpires 2031-01-12';

      // Act
      final result = parser.extractDates(text);

      // Assert
      expect(result, [
        DateTime(2021, 1, 12),
        DateTime(2000, 5, 20),
        DateTime(2031, 1, 12),
      ]);
    });

    test('skips impossible dates', () {
      // Arrange
      const text = '31/02/2000 20/13/2000 00/05/2000 32 MAY 2000';

      // Act
      final result = parser.extractDates(text);

      // Assert
      expect(result, isEmpty);
    });

    test('ignores numbers that are not dates', () {
      // Arrange
      const text = 'MATRIC NO: 18/SC/CO/123 NIN 12345678901 20 MOON 2000';

      // Act
      final result = parser.extractDates(text);

      // Assert
      expect(result, isEmpty);
    });
  });

  group('extractDateOfBirth', () {
    test('uses the date on the same line as the label', () {
      // Arrange
      const text = 'DATE ISSUED: 15-01-2019\nDOB: 20-05-2000';

      // Act
      final result = parser.extractDateOfBirth(text);

      // Assert
      expect(result, DateTime(2000, 5, 20));
    });

    test('uses the date on the line after the label', () {
      // Arrange
      const text = ninSlipText;

      // Act
      final result = parser.extractDateOfBirth(text);

      // Assert
      expect(result, DateTime(2000, 5, 20));
    });

    test('prefers the labelled date over an earlier unlabelled one', () {
      // Arrange
      const text = 'Registered 01/01/1990\nDate of Birth: 20/05/2000';

      // Act
      final result = parser.extractDateOfBirth(text);

      // Assert
      expect(result, DateTime(2000, 5, 20));
    });

    test('falls back to the earliest date when there is no label', () {
      // Arrange
      const text = 'Issued 12/01/2021\n20/05/2000\nExpires 12/01/2031';

      // Act
      final result = parser.extractDateOfBirth(text);

      // Assert
      expect(result, DateTime(2000, 5, 20));
    });

    test('falls back to the earliest date when the label has no date', () {
      // Arrange
      const text = 'Date of Birth\nUnknown\nIssued 12/01/2021\n20/05/2000';

      // Act
      final result = parser.extractDateOfBirth(text);

      // Assert
      expect(result, DateTime(2000, 5, 20));
    });

    test('returns null when the text has no dates', () {
      // Arrange
      const text = 'UNIVERSITY OF UYO\nSTUDENT IDENTITY CARD';

      // Act
      final result = parser.extractDateOfBirth(text);

      // Assert
      expect(result, isNull);
    });
  });
}

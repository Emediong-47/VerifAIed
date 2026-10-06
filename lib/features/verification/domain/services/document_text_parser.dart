import 'package:injectable/injectable.dart';

@lazySingleton
class DocumentTextParser {
  const DocumentTextParser();

  static final _dayMonthYear = RegExp(
    r'\b(\d{1,2})[/\-.](\d{1,2})[/\-.](\d{4})\b',
  );
  static final _yearMonthDay = RegExp(r'\b(\d{4})-(\d{1,2})-(\d{1,2})\b');
  static final _dayMonthNameYear = RegExp(
    r'\b(\d{1,2})[\s\-]+([A-Za-z]{3,9})[\s\-,]+(\d{4})\b',
  );
  static final _dateOfBirthLabel = RegExp(
    r'DATE\s*OF\s*BIRTH|\bD\.?\s?O\.?\s?B\b|\bBIRTH\b',
    caseSensitive: false,
  );

  static const _months = [
    'JANUARY',
    'FEBRUARY',
    'MARCH',
    'APRIL',
    'MAY',
    'JUNE',
    'JULY',
    'AUGUST',
    'SEPTEMBER',
    'OCTOBER',
    'NOVEMBER',
    'DECEMBER',
  ];

  String normalize(String text) =>
      text.toUpperCase().replaceAll(RegExp(r'[^A-Z0-9]+'), ' ').trim();

  Set<String> words(String text) {
    final normalized = normalize(text);
    return normalized.isEmpty ? {} : normalized.split(' ').toSet();
  }

  List<DateTime> extractDates(String text) {
    final found = <(int, DateTime)>[];

    for (final match in _dayMonthYear.allMatches(text)) {
      final date = _date(match[3]!, match[2]!, match[1]!);
      if (date != null) found.add((match.start, date));
    }
    for (final match in _yearMonthDay.allMatches(text)) {
      final date = _date(match[1]!, match[2]!, match[3]!);
      if (date != null) found.add((match.start, date));
    }
    for (final match in _dayMonthNameYear.allMatches(text)) {
      final month = _monthNumber(match[2]!);
      if (month == null) continue;
      final date = _date(match[3]!, '$month', match[1]!);
      if (date != null) found.add((match.start, date));
    }

    found.sort((a, b) => a.$1.compareTo(b.$1));
    return [for (final (_, date) in found) date];
  }

  DateTime? extractDateOfBirth(String text) {
    final lines = text.split('\n');
    for (var i = 0; i < lines.length; i++) {
      final label = _dateOfBirthLabel.firstMatch(lines[i]);
      if (label == null) continue;

      final sameLine = extractDates(lines[i].substring(label.end));
      if (sameLine.isNotEmpty) return sameLine.first;
      if (i + 1 < lines.length) {
        final nextLine = extractDates(lines[i + 1]);
        if (nextLine.isNotEmpty) return nextLine.first;
      }
    }

    final dates = extractDates(text)..sort();
    return dates.isEmpty ? null : dates.first;
  }

  int? _monthNumber(String name) {
    final upper = name.toUpperCase();
    final index = _months.indexWhere(
      (month) => month == upper || month.substring(0, 3) == upper,
    );
    if (index != -1) return index + 1;
    return upper == 'SEPT' ? 9 : null;
  }

  DateTime? _date(String year, String month, String day) {
    final y = int.parse(year);
    final m = int.parse(month);
    final d = int.parse(day);
    if (m < 1 || m > 12 || d < 1 || d > 31) return null;

    final date = DateTime(y, m, d);
    // Rejects overflowing dates such as 31/02.
    return date.month == m && date.day == d ? date : null;
  }
}

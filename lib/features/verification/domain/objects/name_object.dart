import 'package:freezed_annotation/freezed_annotation.dart';

part 'name_object.freezed.dart';

@freezed
abstract class Name with _$Name {
  const factory Name({
    required String firstName,
    String? middleName,
    required String lastName,
  }) = _Name;
}

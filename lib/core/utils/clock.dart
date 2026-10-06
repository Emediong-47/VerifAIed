import 'package:injectable/injectable.dart';

@lazySingleton
class Clock {
  const Clock();

  DateTime now() => DateTime.now();
}

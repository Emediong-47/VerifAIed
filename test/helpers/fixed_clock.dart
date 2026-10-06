import 'package:verif_aled/core/utils/clock.dart';

class FixedClock extends Clock {
  const FixedClock(this._now);

  final DateTime _now;

  @override
  DateTime now() => _now;
}

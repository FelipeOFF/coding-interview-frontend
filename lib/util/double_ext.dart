import 'package:intl/intl.dart';

class DoubleUtil {
  const DoubleUtil._();

  static NumberFormat get toAppMoneyFractionNumberFormat {
    final format = NumberFormat.decimalPattern('en_US')
      ..maximumFractionDigits = 2
      ..minimumFractionDigits = 2;
    return format;
  }
}

extension DoubleExt on double {
  String get toAppMoneyFraction =>
      DoubleUtil.toAppMoneyFractionNumberFormat.format(this);
}

import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String get formatMoney {
    var format = NumberFormat.currency(locale: "pt_BR", symbol: "\$");
    return format.format(this);
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_fifth_lab/domain/entity/money.dart';
import 'package:intl/intl.dart';

@immutable
class MoneyFormat {
  final String? locale;

  const MoneyFormat([this.locale]);

  String format(Money money) {
    final decimalPlaces = (money.amount >= 1) ? 2 : 4;
    return NumberFormat.simpleCurrency(
      locale: locale,
      name: money.currency,
      decimalDigits: decimalPlaces,
    ).format(money.amount);
  }
}

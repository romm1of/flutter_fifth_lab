import 'package:flutter_fifth_lab/domain/entity/crypto_currency_rate.dart';
import 'package:flutter_fifth_lab/ui/common/money_format.dart';
import 'package:flutter_fifth_lab/ui/common/trend_icon.dart';
import 'package:flutter/material.dart';

class CryptoCurrencyListItem extends StatelessWidget {
  final CryptoCurrencyRate cryptoCurrencyRate;
  final VoidCallback? onTap;

  const CryptoCurrencyListItem({
    Key? key,
    required this.cryptoCurrencyRate,
    this.onTap,
  })  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: context.dividerColor),
            ),
          ),
          child: Row(
            children: <Widget>[
              const SizedBox(width: 16.0),
              Expanded(child: _CryptoCurrencyName(cryptoCurrencyRate)),
              const SizedBox(width: 16.0),
              _CryptoCurrencyRate(cryptoCurrencyRate),
            ],
          ),
        ),
      ),
    );
  }
}

class _CryptoCurrencyName extends StatelessWidget {
  final CryptoCurrencyRate cryptoCurrencyRate;

  const _CryptoCurrencyName(this.cryptoCurrencyRate, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          cryptoCurrencyRate.cryptoCurrency.symbol,
          style: context.subhead,
        ),
        const SizedBox(height: 2),
        Text(
          cryptoCurrencyRate.cryptoCurrency.name,
          style: context.caption,
        )
      ],
    );
  }
}

class _CryptoCurrencyRate extends StatelessWidget {
  final MoneyFormat moneyFormat = MoneyFormat();
  final CryptoCurrencyRate cryptoCurrencyRate;

  _CryptoCurrencyRate(this.cryptoCurrencyRate, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(moneyFormat.format(cryptoCurrencyRate.price)),
        const SizedBox(width: 16.0),
        TrendIcon(cryptoCurrencyRate.trendHistory.hour.trend),
      ],
    );
  }
}

extension _ContextExt on BuildContext {
  Color get dividerColor => Theme.of(this).dividerColor;

  TextStyle? get subhead => Theme.of(this).textTheme.caption;

  TextStyle? get caption => Theme.of(this).textTheme.caption;
}

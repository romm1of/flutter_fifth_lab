import 'package:flutter_fifth_lab/domain/entity/crypto_currency_rate.dart';

abstract class CryptoCurrencyRateDataSource {
  Future<List<CryptoCurrencyRate>> getAll();
}

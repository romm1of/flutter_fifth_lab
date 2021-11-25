import 'package:flutter_fifth_lab/domain/repository/crypto_currency_reate_data_source.dart';
import 'package:flutter_fifth_lab/domain/entity/crypto_currency_rate.dart';

abstract class CryptoCurrencyRateDataStorage
    extends CryptoCurrencyRateDataSource {
  Future<List<CryptoCurrencyRate>> getByName(String name);

  Future<void> saveAll(List<CryptoCurrencyRate> currencies);
}

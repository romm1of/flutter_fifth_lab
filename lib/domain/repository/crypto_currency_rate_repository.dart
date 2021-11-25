import 'package:flutter_fifth_lab/domain/entity/crypto_currency_rate.dart';
import 'package:flutter_bloc_patterns/filter_list.dart';

abstract class CryptoCurrencyRateRepository
    extends FilterListRepository<CryptoCurrencyRate, String> {}

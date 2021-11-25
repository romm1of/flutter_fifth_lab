import 'package:bloc/bloc.dart';
import 'package:clock/clock.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fifth_lab/data/api/coin_market_cap_api_key_provider.dart';
import 'package:flutter_fifth_lab/data/api/coin_market_cap_asset_api_key_provider.dart';
import 'package:flutter_fifth_lab/data/api/coin_market_cap_data_source.dart';
import 'package:flutter_fifth_lab/data/cache/cache_policy.dart';
import 'package:flutter_fifth_lab/data/cache/cache_time_policy.dart';
import 'package:flutter_fifth_lab/data/db/crypto_currency_in_memory_dao.dart';
import 'package:flutter_fifth_lab/domain/bloc/crypto_currency_rate_bloc.dart';
import 'package:flutter_fifth_lab/domain/repository/crypto_currency_rate_cache_repository.dart';
import 'package:flutter_fifth_lab/domain/repository/crypto_currency_rate_data_storage.dart';
import 'package:flutter_fifth_lab/domain/repository/crypto_currency_rate_repository.dart';
import 'package:flutter_fifth_lab/domain/repository/crypto_currency_reate_data_source.dart';
import 'package:http/http.dart';
import 'package:kiwi/kiwi.dart';

class Injector {
  static void inject() {
    final container = KiwiContainer();
    container.registerFactory((c) => Client());
    container.registerSingleton((c) => const Clock());
    container.registerFactory<CoinMarketCapApiKeyProvider>(
      (c) => CoinMarketCapAssetApiKeyProvider(rootBundle),
    );
    container.registerFactory<CryptoCurrencyRateDataSource>(
      (c) => CoinMarketCapCryptoCurrencyDataSource(
        'pro-api.coinmarketcap.com',
        c<Client>(),
        c<CoinMarketCapApiKeyProvider>(),
      ),
    );
    container.registerFactory<CryptoCurrencyRateDataStorage>(
      (c) => CryptoCurrencyRateInMemoryDao(),
    );
    container.registerFactory<CachePolicy>(
      (c) => CacheTimePolicy(
        c<Clock>(),
      ),
    );
    container.registerSingleton<CryptoCurrencyRateRepository>(
      (c) => CryptoCurrencyCacheRepository(
        c<CryptoCurrencyRateDataSource>(),
        c<CryptoCurrencyRateDataStorage>(),
        c<CachePolicy>(),
      ),
    );
    container.registerFactory(
      (c) => CryptoCurrencyRateBloc(
        c<CryptoCurrencyRateRepository>(),
      ),
    );
  }
}

T inject<T>([String? name]) => KiwiContainer().resolve<T>(name);

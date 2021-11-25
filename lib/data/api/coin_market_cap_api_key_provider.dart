import 'package:flutter_fifth_lab/data/api/coin_market_cap_api_key.dart';

abstract class CoinMarketCapApiKeyProvider {
  Future<CoinMarketCapApiKey> getApiKey();
}

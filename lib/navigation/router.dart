import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fifth_lab/domain/entity/crypto_currency_rate.dart';
import 'package:flutter_fifth_lab/ui/detail/crypto_currency_detail_screen.dart';
import 'package:flutter_fifth_lab/ui/list/crypto_currency_list_screen.dart';

class Router {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute<void>(
          builder: (_) => CryptoCurrencyListScreen(),
        );
      case Routes.details:
        return MaterialPageRoute<void>(
          builder: (_) => CryptoCurrencyDetailScreen(
            settings.arguments! as CryptoCurrencyRate,
          ),
        );
      default:
        throw Error();
    }
  }
}

class Routes {
  static const String home = '/';
  static const String details = '/details';
}

import 'package:flutter_bloc_patterns/view.dart';
import 'package:flutter_fifth_lab/injector/injector.dart';
import 'package:flutter_fifth_lab/domain/bloc/crypto_currency_rate_bloc.dart';
import 'package:flutter_fifth_lab/domain/entity/crypto_currency_rate.dart';
import 'package:flutter_fifth_lab/navigation/router.dart';
import 'package:flutter_fifth_lab/ui/list/crypto_currency_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CryptoCurrencyListScreen extends StatefulWidget {
  @override
  _CryptoCurrencyListScreenState createState() =>
      _CryptoCurrencyListScreenState();
}

class _CryptoCurrencyListScreenState extends State<CryptoCurrencyListScreen> {
  late CryptoCurrencyRateBloc _cryptoCurrencyBloc;

  @override
  void initState() {
    super.initState();
    _cryptoCurrencyBloc = inject<CryptoCurrencyRateBloc>()..loadElements();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crypto Rates')),
      body: ViewStateBuilder<List<CryptoCurrencyRate>, CryptoCurrencyRateBloc>(
        bloc: _cryptoCurrencyBloc,
        onLoading: (context) => const LinearProgressIndicator(),
        onSuccess: (context, cryptoCurrencies) => CryptoCurrencyList(
          cryptoCurrencies,
          onValueSelected: _navigateToCryptoCurrencyDetails,
          onRefresh: _cryptoCurrencyBloc.refreshElements,
        ),
        onRefreshing: (context, cryptoCurrencies) =>
            CryptoCurrencyList(cryptoCurrencies),
      ),
    );
  }

  Future<void> _navigateToCryptoCurrencyDetails(CryptoCurrencyRate value) {
    return Navigator.pushNamed(context, Routes.details, arguments: value);
  }

  @override
  void dispose() {
    _cryptoCurrencyBloc.close();
    super.dispose();
  }
}

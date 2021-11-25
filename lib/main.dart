import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fifth_lab/crypto_currency_app.dart';
import 'package:flutter_fifth_lab/injector/injector.dart';

void main() {
  _ensureFlutterBindingsInitialized();
  _injectDependencies();
  runApp(CryptoCurrencyApp());
}

void _ensureFlutterBindingsInitialized() =>
    WidgetsFlutterBinding.ensureInitialized();

void _injectDependencies() => Injector.inject();

import 'package:flutter_fifth_lab/navigation/router.dart' as nav;
import 'package:flutter/material.dart';

class CryptoCurrencyApp extends StatelessWidget {
  const CryptoCurrencyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Rates',
      theme: ThemeData(
        primaryColor: Colors.white,
        brightness: Brightness.light,
      ),
      onGenerateRoute: nav.Router().generateRoute,
      initialRoute: nav.Routes.home,
    );
  }
}

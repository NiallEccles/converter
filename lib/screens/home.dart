import 'package:flutter/material.dart';
import 'package:international_system_of_units/international_system_of_units.dart';
import '../components/cDrawer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  // final language = 'en_GB';
  // final sIi18n = InternationalSystemLocalizations.load(Locale.parse(language));
  // Intl.defaultLocale = language;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Converter'),
      ),
      drawer: CDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(15.toKelvin(TemperatureUnit.celsius).toFahrenheit.toString()),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:international_system_of_units/international_system_of_units.dart';
import '../components/cDrawer.dart';

class TemperaturePage extends StatefulWidget {
  TemperaturePage({Key key, this.title}) : super(key: key);
  final String title;
  // final language = 'en_GB';
  // final sIi18n = InternationalSystemLocalizations.load(Locale.parse(language));
  // Intl.defaultLocale = language;

  @override
  _TemperatureState createState() => _TemperatureState();
}

class _TemperatureState extends State<TemperaturePage> {
  final List<String> units = [
    'Celsius',
    'Fahrenheit',
    'Kelvin',
    'Rakine',
    'Romer'
  ];
  final Map convertFrom = {
    'celsius': TemperatureUnit.celsius,
    'fahrenheit': TemperatureUnit.fahrenheit,
    'rakine': TemperatureUnit.rankine,
    'romer': TemperatureUnit.romer
  };
  double unitOneValue = 0;
  double unitTwoValue = 32.0;
  String dropdownOneUnit = 'Celsius';
  String dropdownTwoUnit = 'Fahrenheit';
  var unitOneController = TextEditingController();
  var unitTwoController = TextEditingController();

  updateUnitOne(String unit) {
    if (unit == null || unit == '') {
      setState(() {
        unitOneValue = 0;
        unitTwoValue = 0;
        unitTwoController.text = 0.toString();
      });
      return;
    }

    var conversion =
        createConversion(false, dropdownOneUnit, dropdownTwoUnit, unit);

    setState(() {
      unitTwoValue = conversion;
      unitOneValue = double.parse(unit);
      unitTwoController.text = unitTwoValue.toString();
    });
  }

  updateUnitTwo(String unit) {
    if (unit == null || unit == '') {
      setState(() {
        unitOneValue = 0;
        unitTwoValue = 0;
        unitOneController.text = 0.toString();
      });
      return;
    }

    var conversion =
        createConversion(true, dropdownOneUnit, dropdownTwoUnit, unit);

    setState(() {
      unitOneValue = conversion;
      unitTwoValue = double.parse(unit);
      unitOneController.text = unitOneValue.toString();
    });
  }

  createConversion(reverse, firstUnit, secondUnit, unit) {
    var conversion = 0.0;
    switch (reverse ? secondUnit : firstUnit) {
      case 'Celsius':
        conversion = double.parse(unit).toKelvin(TemperatureUnit.celsius);
        break;
      case 'Fahrenheit':
        conversion = double.parse(unit).toKelvin(TemperatureUnit.fahrenheit);
        break;
      case 'Rankine':
        conversion = double.parse(unit).toKelvin(TemperatureUnit.rankine);
        break;
      case 'Romer':
        conversion = double.parse(unit).toKelvin(TemperatureUnit.romer);
        break;
      case 'Kelvin':
        conversion = double.parse(unit).toKelvin(TemperatureUnit.kelvin);
        break;
    }
    switch (reverse ? firstUnit : secondUnit) {
      case 'Celsius':
        conversion = conversion.toCelsius;
        break;
      case 'Fahrenheit':
        conversion = conversion.toFahrenheit;
        break;
      case 'Rankine':
        conversion = conversion.toRankine;
        break;
      case 'Romer':
        conversion = conversion.toRomer;
        break;
      case 'Kelvin':
        conversion = conversion.toKelvin(TemperatureUnit.kelvin);
        break;
    }
    return conversion;
  }

  @override
  Widget build(BuildContext context) {
    // dropdownOneUnit = units[0].toString();
    // dropdownTwoUnit = units[1].toString();

    return new Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Temperature'),
            Icon(Icons.thermostat_rounded),
          ],
        ),
      ),
      drawer: CDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        unitOneValue.toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5),
                      Text(
                        dropdownOneUnit,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Text(
                    '=',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        unitTwoValue.toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5),
                      Text(
                        dropdownTwoUnit,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: unitOneController,
              onChanged: (text) {
                updateUnitOne(text);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: dropdownOneUnit,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DropdownButton<String>(
                    value: dropdownOneUnit,
                    icon: const Icon(
                      Icons.expand_more,
                      color: Colors.blue,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.blue),
                    underline: Container(
                      height: 2,
                      color: Colors.blue,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownOneUnit = newValue;
                      });
                      updateUnitOne(unitOneValue.toString());
                    },
                    items: units.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  Icon(Icons.arrow_forward),
                  DropdownButton<String>(
                    value: dropdownTwoUnit,
                    icon: const Icon(
                      Icons.expand_more,
                      color: Colors.blue,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.blue),
                    underline: Container(
                      height: 2,
                      color: Colors.blue,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownTwoUnit = newValue;
                      });
                      updateUnitTwo(unitTwoValue.toString());
                    },
                    items: units.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: unitTwoController,
              onChanged: (text) {
                updateUnitTwo(text);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: dropdownTwoUnit,
              ),
            ),
            // Text(15.toKelvin(TemperatureUnit.celsius).toFahrenheit.toString()),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:international_system_of_units/international_system_of_units.dart';
import '../components/cDrawer.dart';

class SpeedPage extends StatefulWidget {
  SpeedPage({Key key, this.title}) : super(key: key);
  final String title;
  // final language = 'en_GB';
  // final sIi18n = InternationalSystemLocalizations.load(Locale.parse(language));
  // Intl.defaultLocale = language;

  @override
  _LengthState createState() => _LengthState();
}

class _LengthState extends State<SpeedPage> {
  final List<String> units = [
    'Knots',
    'Meters per second',
    'Kilometers per hour',
    'Miles per hour',
  ];
  final Map convertFrom = {
    'knots': LengthPerTimeUnit.knot,
    'meters per second': LengthPerTimeUnit.meterPerSecond,
    'kilometers per hour': LengthPerTimeUnit.kilometerPerHour,
    'miles per hour': LengthPerTimeUnit.milePerHour,
  };
  double unitOneValue = 0;
  double unitTwoValue = 0;
  String dropdownOneUnit = 'Kilometers per hour';
  String dropdownTwoUnit = 'Miles per hour';
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
      case 'Knots':
        conversion =
            double.parse(unit).toMeterPerSecond(LengthPerTimeUnit.knot);
        break;
      case 'Kilometers per hour':
        conversion = double.parse(unit)
            .toMeterPerSecond(LengthPerTimeUnit.kilometerPerHour);
        break;
      case 'Miles per hour':
        conversion =
            double.parse(unit).toMeterPerSecond(LengthPerTimeUnit.milePerHour);
        break;
      case 'Meter per second':
        conversion = double.parse(unit)
            .toMeterPerSecond(LengthPerTimeUnit.meterPerSecond);
        break;
    }
    switch (reverse ? firstUnit : secondUnit) {
      case 'Knots':
        conversion = conversion.toKnot;
        break;
      case 'Kilometers per hour':
        conversion = conversion.toKilometerPerHour;
        break;
      case 'Miles per hour':
        conversion = conversion.toMilePerHour;
        break;
      case 'Meters per second':
        conversion =
            conversion.toMeterPerSecond(LengthPerTimeUnit.meterPerSecond);
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
            Text('Speed'),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.speed),
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
                updateUnitOne(text);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: dropdownTwoUnit,
              ),
            ),
            // Text(15.toMeterPerSecond(LengthPerTimeUnit.celsius).toFahrenheit.toString()),
          ],
        ),
      ),
    );
  }
}

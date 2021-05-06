import 'package:flutter/material.dart';
import 'package:international_system_of_units/international_system_of_units.dart';
import '../components/cDrawer.dart';

class LengthPage extends StatefulWidget {
  LengthPage({Key key, this.title}) : super(key: key);
  final String title;
  // final language = 'en_GB';
  // final sIi18n = InternationalSystemLocalizations.load(Locale.parse(language));
  // Intl.defaultLocale = language;

  @override
  _LengthState createState() => _LengthState();
}

class _LengthState extends State<LengthPage> {
  final List<String> units = [
    'Nanometers',
    'Micrometers',
    'Millimeters',
    'Centimeters',
    'Meter',
    'Kilometers',
    'Inch',
    'Foot',
    'Yard',
    'Miles',
    'Nautical Miles'
  ];
  final Map convertFrom = {
    'nanometers': LengthUnit.nanometer,
    'micrometers': LengthUnit.micrometer,
    'millimeters': LengthUnit.millimeter,
    'centimeters': LengthUnit.centimeter,
    'meter': LengthUnit.meter,
    'kilometers': LengthUnit.kilometer,
    'inch': LengthUnit.inch,
    'foot': LengthUnit.foot,
    'yard': LengthUnit.yard,
    'miles': LengthUnit.mile,
    'nautical miles': LengthUnit.nauticalMile,
  };
  double unitOneValue = 0;
  double unitTwoValue = 0;
  String dropdownOneUnit = 'Yard';
  String dropdownTwoUnit = 'Meter';
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
      case 'Nanometers':
        conversion = double.parse(unit).toMeter(LengthUnit.nanometer);
        break;
      case 'Micrometers':
        conversion = double.parse(unit).toMeter(LengthUnit.micrometer);
        break;
      case 'Millimeters':
        conversion = double.parse(unit).toMeter(LengthUnit.millimeter);
        break;
      case 'Centimeters':
        conversion = double.parse(unit).toMeter(LengthUnit.centimeter);
        break;
      case 'Kilometers':
        conversion = double.parse(unit).toMeter(LengthUnit.kilometer);
        break;
      case 'Inch':
        conversion = double.parse(unit).toMeter(LengthUnit.inch);
        break;
      case 'Foot':
        conversion = double.parse(unit).toMeter(LengthUnit.foot);
        break;
      case 'Yard':
        conversion = double.parse(unit).toMeter(LengthUnit.yard);
        break;
      case 'Miles':
        conversion = double.parse(unit).toMeter(LengthUnit.mile);
        break;
      case 'Nautical Miles':
        conversion = double.parse(unit).toMeter(LengthUnit.nauticalMile);
        break;
      case 'Meter':
        conversion = double.parse(unit).toMeter(LengthUnit.meter);
        break;
    }
    switch (reverse ? firstUnit : secondUnit) {
            case 'Nanometers':
        conversion = conversion.toNanometer;
        break;
      case 'Micrometers':
        conversion = conversion.toMicrometer;
        break;
      case 'Millimeters':
        conversion = conversion.toMillimeter;
        break;
      case 'Centimeters':
        conversion = conversion.toCentimeter;
        break;
      case 'Kilometers':
        conversion = conversion.toKilometer;
        break;
      case 'Inch':
        conversion = conversion.toInch;
        break;
      case 'Foot':
        conversion = conversion.toFoot;
        break;
      case 'Yard':
        conversion = conversion.toYard;
        break;
      case 'Miles':
        conversion = conversion.toMile;
        break;
      case 'Nautical Miles':
        conversion = conversion.toNauticalMile;
        break;
      case 'Meter':
        conversion = conversion.toMeter(LengthUnit.meter);
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
            Text('Length'),
            SizedBox(width: 10,),
            Icon(Icons.straighten),
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
            // Text(15.toMeter(LengthUnit.celsius).toFahrenheit.toString()),
          ],
        ),
      ),
    );
  }
}

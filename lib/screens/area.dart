import 'package:flutter/material.dart';
import 'package:international_system_of_units/international_system_of_units.dart';
import '../components/cDrawer.dart';

class AreaPage extends StatefulWidget {
  AreaPage({Key key, this.title}) : super(key: key);
  final String title;
  // final language = 'en_GB';
  // final sIi18n = InternationalSystemLocalizations.load(Locale.parse(language));
  // Intl.defaultLocale = language;

  @override
  _AreaState createState() => _AreaState();
}

class _AreaState extends State<AreaPage> {
  final List<String> units = [
    'Square Centimeters',
    'Square Meters',
    'Square Kilometers',
    'Square Miles',
    'Square Yard',
    'Square Foot',
    'Square Inches',
    'Hectare',
    'Acre',
  ];
  final Map convertFrom = {
    'square centimeters': AreaUnit.squareCentimeters,
    'square meters': AreaUnit.squareMeters,
    'square kilometers': AreaUnit.squareKilometers,
    'square miles': AreaUnit.squareMiles,
    'square yard': AreaUnit.squareYard,
    'square foot': AreaUnit.squareFoot,
    'square inches': AreaUnit.squareInches,
    'square hectare': AreaUnit.hectare,
    'square acre': AreaUnit.acre,
  };
  double unitOneValue = 0;
  double unitTwoValue = 0;
  String dropdownOneUnit = 'Square Meters';
  String dropdownTwoUnit = 'Square Yard';
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
      case 'Square Centimeters':
        conversion =
            double.parse(unit).toSquareMeters(AreaUnit.squareCentimeters);
        break;
      case 'Square Kilometers':
        conversion =
            double.parse(unit).toSquareMeters(AreaUnit.squareKilometers);
        break;
      case 'Square Miles':
        conversion = double.parse(unit).toSquareMeters(AreaUnit.squareMiles);
        break;
      case 'Square Yard':
        conversion = double.parse(unit).toSquareMeters(AreaUnit.squareYard);
        break;
      case 'Square Foot':
        conversion = double.parse(unit).toSquareMeters(AreaUnit.squareFoot);
        break;
      case 'Square Inches':
        conversion = double.parse(unit).toSquareMeters(AreaUnit.squareInches);
        break;
      case 'Hectare':
        conversion = double.parse(unit).toSquareMeters(AreaUnit.hectare);
        break;
      case 'Acre':
        conversion = double.parse(unit).toSquareMeters(AreaUnit.acre);
        break;
      case 'Square Meter':
        conversion = double.parse(unit).toSquareMeters(AreaUnit.squareMeters);
        break;
    }
    switch (reverse ? firstUnit : secondUnit) {
      case 'Square Centimeters':
        conversion = conversion.toSquareCentimeters;
        break;
      case 'Square Kilometers':
        conversion = conversion.toSquareKilometers;
        break;
      case 'Square Miles':
        conversion = conversion.toSquareMiles;
        break;
      case 'Square Yard':
        conversion = conversion.toSquareYard;
        break;
      case 'Square Foot':
        conversion = conversion.toSquareFoot;
        break;
      case 'Square Inches':
        conversion = conversion.toSquareInches;
        break;
      case 'Hectare':
        conversion = conversion.toHectare;
        break;
      case 'Acre':
        conversion = conversion.toAcre;
        break;
      case 'Square Meter':
        conversion = conversion.toSquareMeters(AreaUnit.squareMeters);
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
            Text('Area'),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.crop_square),
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
            // Text(15.toSquareMeters(AreaUnit.celsius).toFahrenheit.toString()),
          ],
        ),
      ),
    );
  }
}

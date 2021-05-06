import 'package:converter/screens/length.dart';
import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/temperature.dart';

var customRoutes = <String, WidgetBuilder>{
  '/home': (context) => MyHomePage(),
  '/temperature': (context) => TemperaturePage(),
};
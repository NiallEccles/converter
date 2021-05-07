import 'package:converter/screens/home.dart';
import 'package:converter/screens/speed.dart';
import 'package:converter/screens/temperature.dart';
import 'package:converter/screens/length.dart';
import 'package:converter/screens/area.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // if (settings.isInitialRoute)
      return child;
    // Fades between routes. (If you don't want any animation, 
    // just return child.)
    // return new FadeTransition(opacity: animation, child: child);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // initialRoute: '/home',
      home: MyHomePage(),
      // routes: customRoutes,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/home': return new MyCustomRoute(
            builder: (_) => new MyHomePage(),
            settings: settings,
          );
          case '/temperature': return new MyCustomRoute(
            builder: (_) => new TemperaturePage(),
            settings: settings,
          );
          case '/length': return new MyCustomRoute(
            builder: (_) => new LengthPage(),
            settings: settings,
          );
          case '/area': return new MyCustomRoute(
            builder: (_) => new AreaPage(),
            settings: settings,
          );
          case '/speed': return new MyCustomRoute(
            builder: (_) => new SpeedPage(),
            settings: settings,
          );
        }
      }
    );
  }
}

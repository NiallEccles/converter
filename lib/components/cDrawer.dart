import 'package:flutter/material.dart';

class CDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pushNamed(context, "/home");
            },
          ),
          const Divider(
            height: 20,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            title: Text('Area'),
            trailing: Icon(Icons.crop_square),
            onTap: () {
              Navigator.pushNamed(context, "/area");
            },
          ),
          ListTile(
            title: Text('Length'),
            trailing: Icon(Icons.straighten),
            onTap: () {
              Navigator.pushNamed(context, "/length");
            },
          ),
          ListTile(
            title: Text('Speed'),
            trailing: Icon(Icons.speed),
            onTap: () {
              Navigator.pushNamed(context, "/speed");
            },
          ),
          ListTile(
            title: Text('Volume'),
            trailing: Icon(Icons.local_drink),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Mass'),
            trailing: Icon(Icons.fitness_center),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Pressure'),
            trailing: Icon(Icons.compress),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Temperature'),
            trailing: Icon(Icons.thermostat_rounded),
            onTap: () {
              // Navigator.pop(context);
              Navigator.pushNamed(context, "/temperature");
            },
          ),
          ListTile(
            title: Text('Time'),
            trailing: Icon(Icons.schedule),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Fuel Economy'),
            trailing: Icon(Icons.local_gas_station),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

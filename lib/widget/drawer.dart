import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  // const Drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text('meals'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('setting'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/setting');
            },
          ),
        ],
      ),
    );
  }
}

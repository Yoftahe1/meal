import '../widget/drawer.dart';
import 'package:flutter/material.dart';

class MySetting extends StatelessWidget {
  // const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text('hi')),
      body: Text('hi'),
    );
  }
}

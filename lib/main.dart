import './screen/setting.dart';
import 'package:flutter/material.dart';
import './screen/category_grid.dart';
import './screen/tab_page.dart';
import './screen/meal_page.dart';
import './screen/meal_detail.dart';
import './screen/setting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal',
      theme: ThemeData(primaryColor: Colors.blue, fontFamily: 'Raleway'),
      // home: TabPage(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabPage(),
        '/meals': (ctx) => MealPage(),
        '/selectedMeal': (ctx) => MealDetail(),
        '/setting': (ctx) => MySetting(),
      },
      onUnknownRoute: ((settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategorGrid(),
        );
      }),
    );
  }
}

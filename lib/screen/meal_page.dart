import '../model/category.dart';
import 'package:flutter/material.dart';
import '../model/dummy_data.dart';
import '../widget/meal_item.dart';

class MealPage extends StatelessWidget {
  // const MyWidget({super.key});
  // final String title;
  // Meal(this.title);
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final CategoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(routeArg['id']);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(routeArg['title']!)),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
                id: CategoryMeal[index].id,
                title: CategoryMeal[index].title,
                imageUrl: CategoryMeal[index].imageUrl,
                duration: CategoryMeal[index].duration,
                complexity: CategoryMeal[index].complexity,
                affordability: CategoryMeal[index].affordability);
          },
          itemCount: CategoryMeal.length),
    );
  }
}

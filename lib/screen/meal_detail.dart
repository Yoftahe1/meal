import 'package:flutter/material.dart';
import '../model/dummy_data.dart';
import '../model/meal.dart';

class MealDetail extends StatelessWidget {
  // const MyWidget({super.key});
  String ComplexityTest(Enum complexity) {
    switch (complexity) {
      case Complexity.Simple:
        return 'simple';

      case Complexity.Challenging:
        return 'Challenging';

      case Complexity.Hard:
        return 'Hard';

      default:
        return 'Unkown';
    }
  }

  String AffordabilityTest(Enum affordability) {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';

      case Affordability.Pricey:
        return 'Pricey';

      case Affordability.Luxurious:
        return 'Luxurious';

      default:
        return 'Unkown';
    }
  }

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final meal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == routeArg['id'];
    });

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
              width: double.infinity,
              height: 300,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Icon(Icons.schedule),
                              margin: EdgeInsets.only(right: 2),
                            ),
                            Text('${meal.duration} min')
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: Icon(Icons.work),
                              margin: EdgeInsets.only(right: 2),
                            ),
                            Text(ComplexityTest(meal.complexity))
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: Icon(Icons.attach_money),
                              margin: EdgeInsets.only(right: 2),
                            ),
                            Text(AffordabilityTest(meal.affordability))
                          ],
                        )
                      ],
                    ),
                    Text('ingredients'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: meal.ingredients.map((e) => Text(e)).toList(),
                    ),
                    Text('steps'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: meal.steps.map((e) => Text(e)).toList(),
                    ),
                    Text('isGlutenFree: ${meal.isGlutenFree}'),
                    Text('isVegan: ${meal.isVegan}'),
                    Text('isVegetarian: ${meal.isVegetarian}'),
                    Text('isLactoseFree: ${meal.isLactoseFree}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

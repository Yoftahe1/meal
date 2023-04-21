import '../model/meal.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  // const MealItem({super.key});
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });
  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/selectedMeal', arguments: {'id': id});
  }

  String get ComplexityTest {
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

  String get AffordabilityTest {
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
    return InkWell(
      onTap: () {
        selectMeal(context);
      },
      child: Card(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                Positioned(
                  bottom: 10,
                  right: 5,
                  child: Container(
                    width: 250,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        child: Icon(Icons.schedule),
                        margin: EdgeInsets.only(right: 2),
                      ),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Icon(Icons.work),
                        margin: EdgeInsets.only(right: 2),
                      ),
                      Text(ComplexityTest)
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Icon(Icons.attach_money),
                        margin: EdgeInsets.only(right: 2),
                      ),
                      Text(AffordabilityTest)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
      ),
    );
  }
}

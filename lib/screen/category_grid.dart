import 'package:flutter/material.dart';
import '../model/dummy_data.dart';
import '../widget/item.dart';

class CategorGrid extends StatelessWidget {
  // const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      children:
          DUMMY_CATEGORIES.map((e) => Item(e.title, e.id, e.color)).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, //width of each grid
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  // const MyWidget({super.key});
  final String title;
  final String id;
  final Color color;
  Item(this.title, this.id, this.color);
  void selectCategory(BuildContext ctx) {
    // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    //   return Meal(title);
    // }));
    Navigator.of(ctx)
        .pushNamed('/meals', arguments: {'title': title, 'id': id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      splashColor: color,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Text(title),
        decoration: BoxDecoration(
            color: color.withOpacity(.7),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}

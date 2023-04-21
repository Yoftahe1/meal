import 'package:flutter/material.dart';
import './category_grid.dart';
import '../widget/drawer.dart';
// class TabPage extends StatefulWidget {
//   const TabPage({super.key});

//   @override
//   State<TabPage> createState() => _TabPageState();
// }

// class _TabPageState extends State<TabPage> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//               title: Text('meals'),
//               bottom: TabBar(
//                 tabs: [
//                   Tab(
//                     icon: Icon(Icons.category),
//                     text: 'categories',
//                   ),
//                   Tab(
//                     text: 'favorite',
//                     icon: Icon(Icons.favorite),
//                   )
//                 ],
//               )),
//           body: TabBarView(children: [CategorGrid(), Text('data')]),
//         ));
//   }
// }

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  final List<Map<String, dynamic>> selectedPage = [
    {'page': CategorGrid(), 'title': 'category'},
    {'page': Text('hi'), 'title': 'favorite'}
  ];
  int index = 0;
  void selectPage(int idx) {
    setState(() {
      index = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPage[index]['title']),
      ),
      drawer: MyDrawer(),
      body: selectedPage[index]['page'],
      bottomNavigationBar:
          BottomNavigationBar(onTap: selectPage, currentIndex: index, items: [
        BottomNavigationBarItem(icon: Icon(Icons.category), label: 'category'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'favorite'),
      ]),
    );
  }
}

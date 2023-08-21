import 'package:flutter/material.dart';
import 'package:instargram/style.dart' as style;

void main() {
  runApp(
      MaterialApp(
          home : MyApp(),
          theme: style.theme
      )
  );
}

// var title = TextStyle(color: Colors.black);

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Instagram'),
        actions: [IconButton(
            icon: Icon(Icons.add_box_outlined),
            onPressed: (){},
            iconSize: 30,
        ),
      ],),
      body: Text('안녕'),
      bottomNavigationBar:
      BottomNavigationBar(
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: '샵'),
        ],
      )
    );

  }
}

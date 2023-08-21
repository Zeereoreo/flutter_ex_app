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

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var tab = 0;

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
      ],
      ),
      body: [Text('홈페이지'), Text('샵페이지')][tab],
      //PageView()는 스와이프 나오는 모양
      bottomNavigationBar:
      BottomNavigationBar(
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        onTap: (i){
          setState(() {
            tab = i;
          });
          },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: '샵'),
        ],
      )
    );

  }
}

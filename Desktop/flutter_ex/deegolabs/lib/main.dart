import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('deego'),),
        body: Container(

        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(onPressed: (){}, child: Text('홈')),
                TextButton(onPressed: (){}, child: Text('디고찾기')),
                TextButton(onPressed: (){}, child: Text('포인트')),
                TextButton(onPressed: (){}, child: Text('설정')),
              ],
            ),
          )
        ),
      ),
    );
  }
}




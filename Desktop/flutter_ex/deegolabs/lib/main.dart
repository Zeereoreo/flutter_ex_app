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
                OutlinedButton(onPressed: (){}, child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: const [
                      Text('Home'),
                      Icon(Icons.home_filled),
                    ],
                  ),
                )),
                ElevatedButton(onPressed: (){}, child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: const [
                      Text('디고찾기'),
                      Icon(Icons.map_rounded),
                    ],
                  ),
                )),
                TextButton(onPressed: (){}, child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: const [
                      Text('포인트'),
                      Icon(Icons.store_rounded),
                    ],
                  ),
                )),
                TextButton(onPressed: (){}, child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: const [
                      Text('설정'),
                      Icon(Icons.settings),
                    ],
                  ),
                )),
              ],
            ),
          )
        ),
      ),
    );
  }
}






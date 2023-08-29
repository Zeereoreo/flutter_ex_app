import 'package:deegolabs/footer.dart';
import 'package:deegolabs/home.dart';
import 'package:deegolabs/login.dart';
import 'package:flutter/material.dart';
import 'package:deegolabs/point.dart';
import 'package:deegolabs/map.dart';
import 'package:deegolabs/setting.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int tap = 0; // tap 상태는 클래스 멤버 변수로 선언해야 합니다

  final List<Widget> pages = [
    Log(),
    NaverMapApp(),
    Point(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index: tap,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: (i) {
            setState(() {
              tap = i;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.map_rounded), label: '디고찾기'),
            BottomNavigationBarItem(icon: Icon(Icons.store_rounded), label: '포인트'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정'),
          ],
        ),
      ),
    );
  }
}







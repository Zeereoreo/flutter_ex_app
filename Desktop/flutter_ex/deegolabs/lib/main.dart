import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    var a = 'login아이디';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(title: Text('deego'),),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: a,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  children: const <TextSpan>[
                    TextSpan(text: '님, 디고와 함께 \n 지구의 온도를 낮춰보세요!',
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17)
                    )
                  ]
                ),
                ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Container(
                        width: 200,
                        color: Color(0xFFF5F7FB),
                        height: 150,
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              height: 50,
                              child: Text('현재 포인트'),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              height: 60,
                              child: Text('0', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      color: Color(0xFFF5F7FB),
                      height: 150,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 50,
                            child: Text('누적 포인트'),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            height: 60,
                            child: Text('0', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text('즐겨찾는 디고'),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
                ),
                child: Text('즐겨찾는 디고가 없습니다.'),
              ),
              ),
              Container(
                
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(onPressed: (){}, child: Container(
                  // width: double.infinity,
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






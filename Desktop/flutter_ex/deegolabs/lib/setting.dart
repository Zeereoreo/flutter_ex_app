import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});


  @override
  Widget build(BuildContext context) {
    var a = 'login아이디';
    return Container(
      // alignment: Alignment.topLeft,
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
          setBtn(),
          setBtn(),
          setBtn(),
          setBtn(),
          setBtn(),
          setBtn(),

        ],
      ),
    );
  }
}


class setBtn extends StatelessWidget {
  const setBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {  },
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('정보 관리'),
              Icon(Icons.arrow_right_outlined)
            ],
          ),
        ));
  }
}


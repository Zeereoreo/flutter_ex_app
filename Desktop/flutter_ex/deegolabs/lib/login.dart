import 'package:deegolabs/home.dart';
import 'package:flutter/material.dart';


class Log extends StatefulWidget {
  const Log({super.key});


  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
            child: Text("디고로고"),
          ),
          Container(
            margin: EdgeInsets.all(10),
            // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            width: 400,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: '아이디',
                    hintText: 'Enter your email',
                    filled: true, // 배경색을 적용하기 위해 filled 속성을 true로 설정
                    fillColor: Color(0xFFF5F7FB),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 1, color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 1, color: Color(0xFFF5F7FB)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: '비밀번호',
                    hintText: 'Enter your password',
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true, // 배경색을 적용하기 위해 filled 속성을 true로 설정
                    fillColor: Color(0xFFF5F7FB), // 배경색을 #F5F7FB로 지정
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 1, color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 1, color: Color(0xFFF5F7FB)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 400,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: (){},
                      child: Text('로그인'),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFB2EBFC)
                      ),
                  ),
                ),
                TextBtn(),
                OuthBtn(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextBtn extends StatelessWidget {
  const TextBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
              onPressed: (){},
              child: Text('아이디 찾기', style: TextStyle(color: Colors.black),),
          ),
          Text(' | '),
          TextButton(
              onPressed: (){},
              child: Text('비밀번호 찾기', style: TextStyle(color: Colors.black),),

          ),
          Text(' | '), TextButton(
              onPressed: (){},
              child: Text('회원가입', style: TextStyle(color: Colors.black),),
          )
        ],
      ),
    );
  }
}

class OuthBtn extends StatelessWidget {
  const OuthBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Text('네이버로고'),
          ),
          Container(
            child: Text('카카오로고'),
          )
        ],
      ),
    );
  }
}

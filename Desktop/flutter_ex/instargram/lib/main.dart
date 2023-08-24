import 'dart:js_interop';
import 'package:flutter/material.dart';
import 'package:instargram/notification.dart';
import 'package:instargram/style.dart' as style;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (c) => Store1(),),
          ChangeNotifierProvider(create: (c) => Store2(),)
        ],
        child: MaterialApp(
            home : MyApp(),
            theme: style.theme
        ),
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
  var data = [];
  var userImage;
  var userContent;

  saveData() async{
    var storage = await SharedPreferences.getInstance();
    storage.setString('nave', 'john'); //저장
    storage.remove('name'); //삭제
    var result = storage.getString('name'); // 출력
    // print(result);
  }

  addMyData(){
    var myData = {
      'id' : data.length,
      'image' : userImage,
      'likes' : 5,
      'date' : 'July 25',
      'content' : userContent,

    };
    setState(() {
      data.insert(0,myData);
    });
  }

  setUserContent(a){
    setState(() {
      userContent = a;
    });
  }

  addData(a){
    setState(() {
      data.add(a);
    });
  }

  getData() async {
    // cached_network_image 패키지 깔기
    var result = await http.get( Uri.parse('https://codingapple1.github.io/app/data.json') );
    // 예외 처리 방법
    // if (result.statusCode == 200){
    //
    // } else(){
    //
    // }
    var result2 =  jsonDecode(result.body);
    setState((){
      data = result2;
    });
  }
  //initstate()
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    saveData();
    getData();
    initNotification(context);
    }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Text('+'),
        onPressed: (){
        showNotification();
        },
      ),
      appBar: AppBar(
        centerTitle: false,
        title: Text('Instagram'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_box_outlined),
            onPressed: () async {
              var picker = ImagePicker();
              var image = await picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                setState((){
                userImage = File(image.path);
                });
                }

              Navigator.push(context,
                MaterialPageRoute(builder: (c){ return Upload(
                    userImage : userImage,
                    setUserContent:setUserContent,
                    addMyData : addMyData);}
              )
              );
            },
            iconSize: 30,
        ),
      ],
      ),
      body: [Home(data : data, addData :addData), Text('샵페이지')][tab],
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

class Home extends StatefulWidget {
  const Home({Key? key, this.data, this.addData}) : super(key: key);
  final data;
  final addData;


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scroll = ScrollController();

  moreData() async {
    var result = await http.get(Uri.parse("https://codingapple1.github.io/app/more1.json"));
    var result2 = jsonDecode(result.body);
    widget.addData(result2);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scroll.addListener(() { // 필요없어지면 제거하는 것도 알아보기
      if(scroll.position.pixels == scroll.position.maxScrollExtent){ //현재 위치랑 맨 아래 위치
        moreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data.isNotEmpty) {
      return ListView.builder(itemCount: widget.data.length,controller: scroll, itemBuilder: (c, i) {
        return Column(
          children: [
            widget.data[i]['image'].runtimeType == String?
            Image.network(widget.data[i]['image']):
              Image.file(widget.data[i]['image']),
            Container(
              constraints: BoxConstraints(maxWidth: 600),
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  GestureDetector(
                    child: Text(widget.data[i]['user']),
                    onTap: (){
                      Navigator.push(context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => Profile(),
                          transitionsBuilder: (c, a1, a2, child) => FadeTransition(opacity: a1, child: child),
                          transitionDuration: Duration(milliseconds : 500),
                        ),
                      );
                    },
                  ),
                  Text("좋아요 ${widget.data[i]['likes']}"),
                  Text(widget.data[i]['date']),
                  Text(widget.data[i]['content']),
                ],
              ),
            )
          ],
        );
      });
    } else {
      return Center(child: CircularProgressIndicator());
    }

  }
}

class Upload extends StatelessWidget {
  const Upload({Key? key, this.userImage, this.setUserContent, this.addMyData}) : super(key: key);
  final userImage;
  final setUserContent;
  final addMyData;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              addMyData();
            }, icon: Icon(Icons.send))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.file(userImage),
            Text('이미지업로드화면'),
            TextField(
              onChanged: (text){
                setUserContent(text);
              },
            ),
            IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close)
            ),
          ],
        )
    );
  }
}

class Store2 extends ChangeNotifier {
  var name = 'john kim';
  changeName(){
    name = 'john park';
    notifyListeners(); // 재렌더링
  }
}

class Store1 extends ChangeNotifier {
  var follower = 0;
  var check = true;
  var profileImage = [];
  
  getData() async {
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/profile.json'));
    var result2 = jsonDecode(result.body);
    profileImage = result2;
    notifyListeners();
    // print(profileImage);
  }


  followerBtn(){
    if(check == true){
      follower ++;
      check = false;
    } else {
      follower --;
      check = true;
    }
    notifyListeners(); // 재렌더링
  }
}

class Profile extends StatefulWidget {
  const Profile({super.key});


  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<Store1>().getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.watch<Store2>().name)
      ),
      body: CustomScrollView( // 전체의 스크롤 주기 위해
        slivers: [
          SliverToBoxAdapter(
            child: ProfileHeader(),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  (c,i)=>
                    Image.network(context.watch<Store1>().profileImage[i]),

                childCount: context.watch<Store1>().profileImage.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          )
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey,
          // backgroundImage: , 이미지 넣을 때
        ),
        Text('팔로워 ${context.watch<Store1>().follower} 명'),
        ElevatedButton(onPressed: (){
          context.read<Store1>().followerBtn();
        }, child: Text('팔로우') ),
        ElevatedButton(onPressed: (){
          context.read<Store1>().getData();
        }, child: Text('사진가져오기') )
      ],
    );
  }
}


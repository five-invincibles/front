import 'package:flutter/material.dart';
import 'package:front/View/CatInfoPage.dart';

import 'UserPage.dart';
import 'CameraPage.dart';
import 'UploadPicturePage.dart';
import 'CommonBoard.dart';
import 'ChooseCat.dart';

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserPage()));
            },
            child: Container(
              color: Colors.grey,
              child: Text("사용자페이지"),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CameraPage()));
            },
            child: Container(
              color: Colors.grey,
              child: Text("사진 찍기"),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UploadPicturePage()));
            },
            child: Container(
              color: Colors.grey,
              child: Text("사진 등록"),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CatInfoPage()));
            },
            child: Container(
              color: Colors.grey,
              child: Text("고양이 페이지"),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommonBoard()));
            },
            child: Container(
              color: Colors.grey,
              child: Text("공용 게시판"),
            ),
          ),
        ],
      ),
    ));
  }
}

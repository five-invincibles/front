import 'package:flutter/material.dart';
import 'package:front/Controller/main_page_controller.dart';
import 'package:get/get.dart';

class Main extends GetView<MainPageController> {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Get.toNamed('/user'),
            child: Container(
              color: Colors.grey,
              child: Text("사용자페이지"),
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed('/camera'),
            child: Container(
              color: Colors.grey,
              child: Text("사진 찍기"),
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed('/uploadPicture'),
            child: Container(
              color: Colors.grey,
              child: Text("사진 등록"),
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed('/catInfo'),
            child: Container(
              color: Colors.grey,
              child: Text("고양이 페이지"),
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed('/commonBoard'),
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

import 'package:flutter/material.dart';
import 'package:front/Controller/init_page_controller.dart';
import 'package:front/View/main_page.dart';
import 'package:get/get.dart';

class InsertInfo extends GetView<InitPageController> {
  const InsertInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Main()),
                (route) => false);
          },
          child: Container(
            height: 200,
            width: 300,
            child: Text("입력 완료 버튼"),
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

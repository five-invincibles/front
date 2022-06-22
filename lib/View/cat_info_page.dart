import 'package:flutter/material.dart';
import 'package:front/Controller/cat_info_page_controller.dart';
import 'package:get/get.dart';

class CatInfoPage extends GetView<CatInfoPageController> {
  const CatInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("고양이 정보 페이지"),
      ),
    );
  }
}

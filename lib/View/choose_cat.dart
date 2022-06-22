import 'package:flutter/material.dart';
import 'package:front/Controller/choose_cat_controller.dart';
import 'package:get/get.dart';

class ChooseCat extends GetView<ChooseCatController> {
  const ChooseCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("고양이 선택 페이지"),
      ),
    );
  }
}

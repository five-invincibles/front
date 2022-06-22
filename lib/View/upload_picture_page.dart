import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadPicturePage extends GetView<UploadPicturePage> {
  const UploadPicturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () => Get.toNamed('/chooseCat'),
            child: Container(child: Text("고양이 선택"))),
      ),
    );
  }
}

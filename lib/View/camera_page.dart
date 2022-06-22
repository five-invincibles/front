import 'package:flutter/material.dart';
import 'package:front/Controller/camera_page_controller.dart';
import 'package:get/get.dart';

class CameraPage extends GetView<CameraPageController> {
  const CameraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => Get.toNamed('/chooseCat'),
          child: Container(
            child: Text("카메라 페이지"),
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

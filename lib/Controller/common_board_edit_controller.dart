import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CommonBoardEditPageController extends GetxController {
  final TextEditingController editTextController = TextEditingController();
  RxList<File> photos = <File>[].obs;
  final ImagePicker imagePicker = ImagePicker();

  void takePicture() {
    Get.to(() => Scaffold(body: CameraCamera(
          onFile: (file) {
            photos.add(file);
            Get.back();
          },
        )));
  }

  void selectPicture() {
    imagePicker.pickImage(source: ImageSource.gallery).then((xfile) {
      if (xfile == null) return;
      photos.add(File(xfile.path));
    });
  }

  @override
  void onClose() {
    super.onClose();
    editTextController.dispose();
  }
}

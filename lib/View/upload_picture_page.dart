import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:exif/exif.dart';
import 'package:front/View/choose_cat.dart';
import 'package:oktoast/oktoast.dart';

class UploadPicturePage extends GetView<UploadPicturePage> {
  Map<String, dynamic> data = {};

  UploadPicturePage({Key? key}) : super(key: key) {
    _getImage();
  }

  void _getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    try {
      final fileBytes = File(image!.path).readAsBytesSync();
      data = await readExifFromBytes(fileBytes);
    } catch (e) {
      print(e);
    }

    if (data.containsKey("GPS GPSLatitude") &&
        data.containsKey("GPS GPSLongitude")) {
      String dateData = data["Image DateTime"].toString();
      String latitude = data["GPS GPSLatitude"].toString();
      String longitude = data["GPS GPSLongitude"].toString();

      Get.off(ChooseCat(), arguments: {
        "date": dateData,
        "latitude": latitude,
        "longitude": longitude,
        "image": image!.path,
      });
    } else {
      if (data != {}) {
        showToast("위치데이터가 없는 파일입니다", 
        position: ToastPosition.bottom,
        backgroundColor: Colors.grey.withOpacity(0.8),
        );
      }
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("헷")));
  }
}

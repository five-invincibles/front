import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:exif/exif.dart';

import 'choose_cat.dart';

class UploadPicturePage extends GetView<UploadPicturePage> {
  late Map<String, dynamic> data;

  UploadPicturePage({Key? key}) : super(key: key) {
    _getImage();
  }

  void _getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    try {
      final fileBytes = File(image!.path).readAsBytesSync();
      data = await readExifFromBytes(fileBytes);
    } catch(e) {
      Get.back();
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
      // 토스트 메세지
      Get.toNamed("main");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("헷")));
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:front/Controller/camera_page_controller.dart';
import 'package:get/get.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:exif/exif.dart';
import 'package:geolocator/geolocator.dart';

import 'choose_cat.dart';

class CameraPage extends GetView<CameraPageController> {
  const CameraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void getPermission() async {
      // GPS 접근 권한 없으면 요청
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        LocationPermission permission = await Geolocator.requestPermission();
      }
    }

    getPermission();
    Future<Position> getCurrentLocation() async {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return position;
    }

    double convertToDegree(String str) {
      String data = str.substring(1, str.length - 1);
      List<String> tmp = data.split(",");
      List<String> last = tmp[2].split('/');
      int degree = int.parse(tmp[0]);
      int minute = int.parse(tmp[1]);
      double second = int.parse(last[0]) / int.parse(last[1]);
      return degree + minute / 60 + second / 3600;
    }

    return Scaffold(
      body: CameraCamera(onFile: (file) async {
        final fileBytes = file.readAsBytesSync();
        // 사진 정보
        final data = await readExifFromBytes(fileBytes);
        String dateData = data["Image DateTime"].toString();
        print(dateData);
        // 위치 정보
        Position locationData = await getCurrentLocation();
        Get.off(ChooseCat(), arguments: {
          "date": dateData,
          "latitude": double.parse(locationData.latitude.toString()),
          "longitude": double.parse(locationData.longitude.toString()),
          "image": file.path,
        });
      }),
    );
  }
}

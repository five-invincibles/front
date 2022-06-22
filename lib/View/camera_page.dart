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

    return Scaffold(
      body: CameraCamera(onFile: (file) async {
        final fileBytes = file.readAsBytesSync();
        // 사진 정보
        final data = await readExifFromBytes(fileBytes);
        String dateData = data["Image DateTime"].toString();
        // 위치 정보
        Position locationData = await getCurrentLocation();
        Get.off(ChooseCat(), arguments: {
          "date": dateData,
          "latitude": locationData.latitude,
          "longitude": locationData.longitude,
          "image": file.path,
        });
      }),
    );
  }
}

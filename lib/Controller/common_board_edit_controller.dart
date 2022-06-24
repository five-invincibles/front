import 'dart:convert';
import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:dio/dio.dart' as DDio;
import 'package:exif/exif.dart';
import 'package:flutter/material.dart';
import 'package:front/Connect/picture_provicer.dart';
import 'package:front/Model/dms.dart';
import 'package:front/Model/picture/picture_request.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class CommonBoardEditPageController extends GetxController {
  final TextEditingController editTextController = TextEditingController();
  final _picture = Get.put(PictureProvider());
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
    imagePicker.pickImage(source: ImageSource.gallery).then((xfile) async {
      if (xfile == null) return;
      var file = File(xfile.path);

      final fileBytes = file.readAsBytesSync();
      var data = await readExifFromBytes(fileBytes);

      if (data.containsKey("GPS GPSLatitude") &&
          data.containsKey("GPS GPSLongitude")) {
        String dateData = data["Image DateTime"].toString();
        var latitude = _toDMs(data["GPS GPSLatitude"].toString());
        var longitude = _toDMs(data["GPS GPSLongitude"].toString());
        var auth = (await UserApi.instance.accessTokenInfo()).id;
        var req = PictureRequest(
            catID: 2,
            description: 'test',
            kakaoID: auth.toString(),
            latitude: latitude,
            longitude: longitude,
            title: 'test');
        _upload(file, req);
      } else {
        if (data != {}) {
          print('데이터가 없습니다.');
        }
        return;
      }
      photos.add(File(xfile.path));
    });
  }

  DMS _toDMs(String data) {
    var list = data
        .replaceAll('[', '')
        .replaceAll(']', '')
        .split(',')
        .map((e) => e.trim())
        .toList();
    var d = int.parse(list[0]);
    var m = int.parse(list[1]);
    var sList = list[2].split('/');
    var s = (int.parse(list[0]) / int.parse(list[1]));
    return DMS(degree: d, minute: m, second: s);
  }

  void _upload(File file, PictureRequest req) async {
    String fileName = file.path.split('/').last;
    var data = DDio.FormData.fromMap({
      "file": await DDio.MultipartFile.fromFile(
        file.path,
        filename: fileName,
        contentType: MediaType('image', 'png'),
      ),
      'pictureRequest': jsonEncode(req.toJson) + ';type=application/json'
    });

    var dio = DDio.Dio();
    print(req.toJson);
    print(MediaType('image', 'png'));
    print(data.boundary);

    dio
        .post("http://49.50.172.68:1998/api/picture/save", data: data)
        .then((response) => print(response))
        .catchError((error) => print(error));
  }

  @override
  void onClose() {
    super.onClose();
    editTextController.dispose();
  }
}

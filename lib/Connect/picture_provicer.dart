import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:front/Model/picture/picture_request.dart';
import 'package:get/get.dart';

class PictureProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'http://49.50.172.68:1998/api/picture/';
  }

  Future<Response> save(File file, PictureRequest req) => post(
        'save',
        FormData({
          'file': MultipartFile(file, filename: basename(file.path)),
          'pictureRequest': jsonEncode(req.toJson),
        }),
      );
}

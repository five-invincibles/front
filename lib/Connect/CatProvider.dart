import 'dart:io';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:front/Model/lat_long.dart';

class CatProvider extends GetConnect {
  


  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'http://49.50.172.68:1998/api/cat/';
    // httpClient.defaultContentType = 'application/json';
  }

  Future<Response> getNearBy(LatLong req) => post('nearBy', req.toJson());

  Future<Response> postRegister(Map<String, dynamic> data, String path) async {
    MultipartFile f = MultipartFile(await File(path).readAsBytes(),
        filename: "${data['name']}.png");
    data['file'] = f;
    print(data);
    return post('register', data, contentType: "multipart/form-data");
  }
}

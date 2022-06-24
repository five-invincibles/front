import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

// import 'package:http/http.dart' ;
import 'package:front/Controller/insert_cat_info_page_controller.dart';



final a = {
  "catName": "제발",
  "species": "고등어", 
  "age": "unknown", 
  "sex": "미상", 
  "datails": [], 
  "pictureRequest": {"latitude": {"degree": 37, "minute": 25, "second": 24.31999999999732}, 
  "longitude": {"degree": 122, "minute": 5, "second": 2.2299999999631837}, "catID": 0, 
  "kakaoID": 2302258020, "date": "2022-04-05"}};

class hope {
  void upload(File file) async {
    String fileName = file.path.split('/').last;

    FormData data = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
        "catRequest" : jsonEncode(a)
    });

    Dio dio = new Dio();
    dio.post("http://49.50.172.68:1998/api/cat/register", data: data)
    .then((response) => print(response))
    .catchError((error) => print(error));
  }
}

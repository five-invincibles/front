import 'dart:convert';

import 'package:front/Model/dms.dart';

class PictureRequest {
  final int catID;
  final String description;
  final String kakaoID;
  final String title;
  final DMS latitude;
  final DMS longitude;

  PictureRequest(
      {required this.catID,
      required this.description,
      required this.kakaoID,
      required this.title,
      required this.latitude,
      required this.longitude});

  String get toJson {
    return jsonEncode({
      'catId': catID,
      'description': description,
      'kakaoID': kakaoID,
      'title': title,
      'latitude': latitude.toJson,
      'longitude': longitude.toJson,
    });
  }
}

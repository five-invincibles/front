import 'dart:convert';

class UserUpdateRequest {
  final String email;
  final String kakaoID;
  final String name;
  final String university;

  UserUpdateRequest(
      {required this.email,
      required this.kakaoID,
      required this.name,
      required this.university});

  String get toJson {
    return jsonEncode({
      'email': email,
      'kakaoID': kakaoID,
      'name': name,
      'university': university,
    });
  }
}

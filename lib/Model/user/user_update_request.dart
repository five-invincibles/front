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

  Map<String, dynamic> get toJson {
    return {
      'email': email,
      'kakaoID': kakaoID,
      'name': name,
      'university': university,
    };
  }
}

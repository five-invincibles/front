import 'dart:convert';

class signUpRequest {
  final String accessToken;
  final String university;

  signUpRequest({required this.accessToken, required this.university});

  String get toJson {
    return jsonEncode({
      'accessToken': accessToken,
      'university': university,
    });
  }
}

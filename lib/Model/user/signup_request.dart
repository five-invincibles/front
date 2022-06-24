import 'dart:convert';

class signUpRequest {
  final String accessToken;
  final String university;

  signUpRequest({required this.accessToken, required this.university});

  Map<String, dynamic> get toJson {
    return {
      'accessToken': accessToken,
      'university': university,
    };
  }
}

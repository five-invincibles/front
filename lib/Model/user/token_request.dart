import 'dart:convert';

class TokenRequest {
  final String kakaoToken;

  TokenRequest({required this.kakaoToken});

  Map<String, dynamic> get toJson {
    return {"kakaoToken": kakaoToken};
  }
}

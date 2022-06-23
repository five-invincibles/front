import 'dart:convert';

class TokenRequest {
  final String kakaoToken;

  TokenRequest({required this.kakaoToken});

  String get toJson {
    return jsonEncode({"kakaoToken": kakaoToken});
  }
}

import 'package:front/Model/user/signup_request.dart';
import 'package:front/Model/user/token_request.dart';
import 'package:front/Model/user/user_update_request.dart';
import 'package:get/get.dart';

class UserProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'http://49.50.172.68:1998/api/user/';
    httpClient.defaultContentType = 'application/json';
  }

  Future<Response> getUniversities() => get('getUniversities');
  Future<Response> login(TokenRequest req) => post('login', req.toJson);
  Future<Response> me(TokenRequest req) => post('me', req.toJson);
  Future<Response> signUp(signUpRequest req) => post('signup', req.toJson);
  Future<Response> update(UserUpdateRequest req) => post('signup', req.toJson);
}

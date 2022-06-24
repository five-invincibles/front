import 'package:get/get.dart';

class UserProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'http://49.50.172.68:1998/api/user/';
    httpClient.defaultContentType = 'application/json';
  }

  Future<Response> getUniversities() => get('getUniversities');
}

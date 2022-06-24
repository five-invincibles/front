import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:front/Model/user/signup_request.dart';
import 'package:front/Service/auth_service.dart';
import 'package:get/get.dart';
import 'package:front/Connect/user_provider.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class InsertInfoPageController extends GetxController {
  final _userProvider = Get.put(UserProvider());
  final _authService = Get.put(AuthService());

  final searchController = TextEditingController();
  RxList<String> universities = <String>[].obs;

  Future _getUniversity() async {
    var res = await _userProvider.getUniversities();
    var list =
        (res.body['universities'] as List).map((e) => e.toString()).toList();
    universities(list);
  }

  Future<bool> _postSignUp(String token, String uni) async {
    var req = signUpRequest(accessToken: token, university: uni);
    var res = await _userProvider.signUp(req);
    return res.isOk && res.body['sign'];
  }

  Future signUp() async {
    if (!await _postSignUp(
        _authService.token!.accessToken, searchController.text)) {
      return;
    }
    Get.offAllNamed('/catMap');
  }

  @override
  void onReady() {
    super.onReady();
    EasyLoading.show(status: '로딩중...');
    _getUniversity().then((value) => EasyLoading.dismiss());
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class KakaoLoginButton extends StatelessWidget {
  final VoidCallback onTap;
  KakaoLoginButton({Key? key, required this.onTap}) : super(key: key) {
    // 카카오 로그인 되어있으면 바로 페이지 이동
    _loginCheck();
  }

  void _loginCheck() async {
    if (await AuthApi.instance.hasToken()) {
      await UserApi.instance.logout(); // 들어오자마자 자동 로그아웃 임시로 넣음
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          child: Image.asset('assets/image/kakao_login_medium_narrow.png')),
    );
  }
}

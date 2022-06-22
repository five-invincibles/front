import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:get/get.dart';

class KakaoLoginButton extends StatelessWidget {
  KakaoLoginButton({Key? key}) : super(key: key) {
    // 카카오 로그인 되어있으면 바로 페이지 이동
    _loginCheck();
  }

  void _loginCheck() async {
    if (await AuthApi.instance.hasToken()) {
      await UserApi.instance.logout(); // 들어오자마자 자동 로그아웃 임시로 넣음
      // AccessTokenInfo user = await UserApi.instance.accessTokenInfo();
      // print('사용자 정보 요청 성공'
      //     '\n회원번호: ${user.id}');
      // Get.toNamed('/insertInfo');
    }
  }

  // 사용자 정보 처리 (DB 전송 등)
  void _get_user_info() async {
    try {
      User user = await UserApi.instance.me();
      print('사용자 정보 요청 성공'
          '\n회원번호: ${user.id}'
          '\n닉네임: ${user.kakaoAccount?.profile?.nickname}');
      Get.toNamed('/insertInfo');
    } catch (error) {
      print('사용자 정보 요청 실패 $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await isKakaoTalkInstalled()) {
          try {
            // 카카오 로그인 성공
            await UserApi.instance.loginWithKakaoTalk();
            print('카카오톡으로 로그인 성공');
            _get_user_info();
          } catch (error) {
            // 카카오 웹으로 로그인
            print('카카오톡으로 로그인 실패 $error');
            // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
            try {
              await UserApi.instance.loginWithKakaoAccount();
              print('카카오계정으로 로그인 성공');
              _get_user_info();
            } catch (error) {
              print('카카오계정으로 로그인 실패 $error');
            }
          }
        } else {
          // 카카오 웹으로 로그인
          try {
            await UserApi.instance.loginWithKakaoAccount();
            print('카카오계정으로 로그인 성공');
            _get_user_info();
          } catch (error) {
            print('카카오계정으로 로그인 실패 $error');
          }
        }
      },
      child: Container(
          child: Image.asset('assets/image/kakao_login_medium_narrow.png')),
    );
  }
}

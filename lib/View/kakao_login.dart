import 'package:flutter/material.dart';
import 'package:front/Controller/kakao_login_controller.dart';
import 'package:get/get.dart';

class KakaoLogin extends GetView<KakaoLoginController> {
  const KakaoLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => Get.offNamedUntil('/insertInfo', (route) => false),
          child: Container(
            height: 200,
            width: 300,
            child: Text("카카오톡 로그인하기"),
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

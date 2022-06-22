import 'package:flutter/material.dart';
import 'package:front/Controller/kakao_login_controller.dart';
import 'package:get/get.dart';

import 'Widget/KakaoLogin/kakao_login_button.dart';


class KakaoLogin extends GetView<KakaoLoginController> {
  const KakaoLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: KakaoLoginButton(),
        ),
      ),
    );
  }
}

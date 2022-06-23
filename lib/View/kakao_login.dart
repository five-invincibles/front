import 'package:flutter/material.dart';
import 'package:front/Controller/kakao_login_controller.dart';
import 'package:get/get.dart';

import 'Widget/KakaoLogin/kakao_login_button.dart';

class KakaoLogin extends GetView<KakaoLoginController> {
  const KakaoLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/image/login_screen.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Expanded(child: Container()),
              Container(
                  padding: EdgeInsets.only(bottom: 171),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 0,
                          blurRadius: 5.0,
                          offset: Offset(0, 10), // changes position of shadow
                        ),
                      ],
                    ),
                    child: KakaoLoginButton())),
            ],
          ),
        ],
      ),
    );
  }
}

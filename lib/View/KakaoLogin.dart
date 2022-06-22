import 'package:flutter/material.dart';

import './InsertInfo.dart';
import './Widget/KakaoLogin/LoginButton.dart';

class KakaoLogin extends StatelessWidget {
  const KakaoLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const KakaoLoginButton(),
      ),
    );
  }
}

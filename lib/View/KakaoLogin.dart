import 'package:flutter/material.dart';
import './InsertInfo.dart';

class KakaoLogin extends StatelessWidget {
  const KakaoLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => InsertInfo()),
                (route) => false);
          },
          child: Container(
            height: 200, width: 300, child: Text("카카오톡 로그인하기"), color: Colors.grey,),
        ),
      ),
    );
  }
}

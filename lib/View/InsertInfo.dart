import 'package:flutter/material.dart';

import './MainPage.dart';

class InsertInfo extends StatelessWidget {
  const InsertInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Main()),
                (route) => false);
          },
          child: Container(
            height: 200,
            width: 300,
            child: Text("입력 완료 버튼"),
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

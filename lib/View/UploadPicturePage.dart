import 'package:flutter/material.dart';

import 'ChooseCat.dart';

class UploadPicturePage extends StatelessWidget {
  const UploadPicturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(onTap: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChooseCat()));
        },child: Container(child: Text("고양이 선택"))),
      ),
    );
  }
}

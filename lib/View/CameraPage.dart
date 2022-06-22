import 'package:flutter/material.dart';

import 'ChooseCat.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChooseCat()));
          },
          child: Container(
            child: Text("카메라 페이지"),
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

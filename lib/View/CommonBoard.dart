import 'package:flutter/material.dart';

class CommonBoard extends StatelessWidget {
  const CommonBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("공용 게시판")),
    );
  }
}

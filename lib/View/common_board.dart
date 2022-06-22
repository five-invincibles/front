import 'package:flutter/material.dart';
import 'package:front/Controller/common_board_controller.dart';
import 'package:get/get.dart';

class CommonBoard extends GetView<CommonBoardController> {
  const CommonBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("공용 게시판")),
    );
  }
}

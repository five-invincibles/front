import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/Controller/common_board_controller.dart';
import 'package:get/get.dart';

class CommonBoard extends GetView<CommonBoardController> {
  const CommonBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF667080), size: 30),
        title: const Text(
          '고양이 계시판',
          style: TextStyle(color: Color(0xFF667080)),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(CupertinoIcons.search),
            onPressed: () {},
          ),
          IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(CupertinoIcons.person),
            onPressed: () {},
          )
        ],
        elevation: 1.5,
        backgroundColor: Color(0xFFFCFCFC),
      ),
      body: Container(),
    );
  }
}

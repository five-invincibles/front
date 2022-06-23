import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/Controller/common_board_detail_controller.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class CommonBoardDetailPage extends GetView<CommonBoardDetailPageController> {
  const CommonBoardDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF667080), size: 30),
        title: const Text(
          '고양이 계시판',
          style: TextStyle(color: Color(0xFF667080), fontSize: 20),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(CupertinoIcons.ellipsis_vertical),
            onPressed: () {},
          ),
        ],
        elevation: 2.5,
        backgroundColor: Color(0xFFFCFCFC),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Column(children: [
        Expanded(
          child: Container(color: Colors.white),
        ),
        _buildFooter(),
      ]),
    );
  }

  Widget _buildFooter() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(color: Color(0xFFFCFCFC), boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(102, 112, 128, 0.25),
          offset: Offset(0, -2),
        )
      ]),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(children: [
          Container(
            child: CircleAvatar(
              backgroundColor: const Color(0xFFFEBB6C),
              radius: 15,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
          ),
          Expanded(
            child: Container(
              clipBehavior: Clip.hardEdge,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.commentEditingController,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            hintText: "댓글을 입력하세요.",
                            hintStyle: TextStyle(color: Color(0xFF667080)),
                            border: InputBorder.none),
                      ),
                    ),
                    IconButton(
                      iconSize: 18,
                      padding: EdgeInsets.zero,
                      icon: Transform.rotate(
                        angle: 315 * math.pi / 180,
                        child: Icon(
                          Icons.send_outlined,
                          color: Color(0xFFFEBB6C),
                        ),
                      ),
                      onPressed: () {},
                    )
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/Controller/common_board_detail_controller.dart';
import 'package:front/Model/common_board_comment.dart';
import 'package:front/Model/common_board_content.dart';
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
          child: Container(
            color: Colors.white,
            child: ListView.separated(
                shrinkWrap: true,
                itemCount: controller.coments.length + 1,
                itemBuilder: ((context, index) {
                  if (index == 0) return _buildContent(controller.content);
                  return _buildComment(controller.coments.elementAt(index - 1));
                }),
                separatorBuilder: (context, index) => Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 1, color: Color(0xFFD9D9D9)))),
                    )),
          ),
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
          CircleAvatar(
            backgroundColor: const Color(0xFFFEBB6C),
            radius: 15,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 20,
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

  Widget _buildContent(CommonBoardContent content) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              backgroundColor: const Color(0xFFFEBB6C),
              radius: 25,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content.userNick,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  content.contentText,
                  overflow: TextOverflow.fade,
                  style: TextStyle(height: 2, fontSize: 14),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: controller.content.photos
                        .map((e) => _buildContentImage(e))
                        .toList(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6),
                ),
                Row(
                  children: [
                    Row(children: [
                      Icon(
                        Icons.chat_bubble_outline,
                        size: 22,
                        color: Color(0xFF667080),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 7),
                      ),
                      Text(content.commentCount.toString()),
                    ]),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                    ),
                    Row(children: [
                      Icon(
                        Icons.thumb_up_off_alt,
                        size: 22,
                        color: Color(0xFF667080),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 7),
                      ),
                      Text(content.likeCount.toString()),
                    ]),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComment(CommonBoardComment elementAt) {
    return Container(
      color: Color(0xFFFCFCFC),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 17),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              CupertinoIcons.arrow_turn_down_right,
              size: 32,
              color: Color(0xFF667080),
            ),
            Padding(padding: EdgeInsets.only(left: 5)),
            Container(
              padding: EdgeInsets.only(top: 5),
              child: const CircleAvatar(
                backgroundColor: Color(0xFFFEBB6C),
                radius: 20,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Text(
                            elementAt.userNick,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 2),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          width: 1, color: Color(0xFF667080)))),
                              child: Icon(
                                Icons.thumb_up_off_alt,
                                size: 20,
                                color: Color(0xFF667080),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 10),
                              child: Icon(
                                CupertinoIcons.ellipsis_vertical,
                                size: 20,
                                color: Color(0xFF667080),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(
                    elementAt.comentText,
                    style: TextStyle(
                        color: Colors.black, fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),
          ]),
    );
  }

  Widget _buildContentImage(String imgUrl) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1),
      clipBehavior: Clip.hardEdge,
      width: 230,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.network(
        imgUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}

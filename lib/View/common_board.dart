import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/Controller/common_board_controller.dart';
import 'package:front/Model/common_board_tile.dart';
import 'package:get/get.dart';

class CommonBoard extends GetView<CommonBoardController> {
  const CommonBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        focusElevation: 5,
        hoverElevation: 5,
        highlightElevation: 5,
        splashColor: Colors.white.withOpacity(0.1),
        hoverColor: Colors.white,
        backgroundColor: const Color(0xFFFF971E),
        child: const Icon(Icons.edit),
        onPressed: () => Get.toNamed('/commonBoardEdit'),
      ),
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
            icon: const Icon(CupertinoIcons.search),
            onPressed: () {},
          ),
          IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(CupertinoIcons.person),
            onPressed: () => Get.toNamed('/user'),
          )
        ],
        elevation: 2.5,
        backgroundColor: Color(0xFFFCFCFC),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Obx(() => ListView.separated(
          itemCount: controller.tiles.length,
          itemBuilder: (context, index) =>
              _buildTile(controller.tiles.elementAt(index)),
          separatorBuilder: (context, index) => Container(
            decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: Colors.grey))),
          ),
        ));
  }

  Widget _buildTile(CommonBoardTile item) {
    return GestureDetector(
      onTap: () => Get.toNamed('/commonBoardDetail'),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: CircleAvatar(
                backgroundColor: const Color(0xFFFEBB6C),
                radius: 28,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  item.userNick,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  item.tileText,
                  style: TextStyle(height: 1.5, fontSize: 14),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Row(
                  children: [
                    Row(children: [
                      Icon(
                        Icons.chat_bubble_outline,
                        size: 22,
                        color: Color(0xFF96A1B2),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                      ),
                      Text(
                        item.commentCount.toString(),
                        style: TextStyle(
                          color: Color(0xFF96A1B2),
                        ),
                      ),
                    ]),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                    ),
                    Row(children: [
                      Icon(
                        Icons.thumb_up_off_alt,
                        size: 22,
                        color: Color(0xFF96A1B2),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                      ),
                      Text(
                        item.likeCount.toString(),
                        style: TextStyle(
                          color: Color(0xFF96A1B2),
                        ),
                      ),
                    ]),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                    ),
                    item.imageCount == 0
                        ? Container()
                        : Row(children: [
                            Icon(
                              Icons.image_outlined,
                              size: 22,
                              color: Color(0xFF96A1B2),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                            ),
                            Text(
                              item.imageCount.toString(),
                              style: TextStyle(
                                color: Color(0xFF96A1B2),
                              ),
                            ),
                          ]),
                  ],
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}

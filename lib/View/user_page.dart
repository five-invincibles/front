import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/Controller/user_page_controller.dart';
import 'package:front/View/Widget/ChooseCat/marker.dart';
import 'package:get/get.dart';

class UserPage extends GetView<UserPageController> {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFCFCFC),
        shape: const Border(bottom: BorderSide(color: Color(0xFFF0F0F0))),
        centerTitle: true,
        title: const Text(
          '사용자 설정',
        ),
        titleTextStyle: const TextStyle(color: Color(0xFF667080), fontSize: 20),
        iconTheme: const IconThemeData(color: Color(0xFF667080), size: 25),
        elevation: 0,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
            children: [_buildInfo(), _buildFavorite(), _buildCommunity()]),
      ),
    );
  }

  Widget _buildInfo(
      {String userName = '사용자 이름', String university = '한국 대학교'}) {
    return Container(
      height: 110,
      margin: const EdgeInsets.all(10),
      child: Material(
        color: const Color(0xFFF0F0F0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: InkWell(
          splashColor: Colors.white,
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    backgroundColor: const Color(0xFFFEBB6C),
                    radius: 40,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      userName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                    ),
                    Text(
                      university,
                      style: TextStyle(color: Color(0xFF667080), fontSize: 14),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                Row(
                  children: [
                    Text(
                      '변경하기',
                      style: TextStyle(fontSize: 14),
                    ),
                    Icon(
                      CupertinoIcons.chevron_forward,
                      size: 20,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFavorite() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          color: Color(0xFFFCFCFC),
          border: Border.all(color: Color(0xFFF0F0F0))),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.only(top: 20, left: 20),
          child: const Text(
            '즐겨찾기 한 고양이 목록',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            spacing: 30,
            runSpacing: 10,
            children: controller.cats
                .map((e) => Marker(
                      cat: e,
                      width: 60,
                    ))
                .toList(),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 60,
              child: Container(
                margin: EdgeInsets.only(right: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('외 5마리 고양이 '),
                    Text('더보기'),
                    Icon(
                      CupertinoIcons.chevron_forward,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }

  Widget _buildCommunity() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          color: Color(0xFFFCFCFC),
          border: Border.all(color: Color(0xFFF0F0F0))),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20),
            child: const Text(
              '커뮤니티',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            shape: Border.symmetric(
                vertical: BorderSide(color: Color(0xFFF0F0F0))),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                child: Container(
                  margin: EdgeInsets.only(right: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('좋아요 한 목록', style: TextStyle(fontSize: 16)),
                      Icon(
                        CupertinoIcons.chevron_forward,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            shape: Border.symmetric(
                vertical: BorderSide(color: Color(0xFFF0F0F0))),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                child: Container(
                  margin: EdgeInsets.only(right: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '내가 쓴 게시물 보기',
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(
                        CupertinoIcons.chevron_forward,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/Controller/user_page_controller.dart';
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
        child: Column(children: [_buildInfo()]),
      ),
    );
  }

  Container _buildInfo(
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
}

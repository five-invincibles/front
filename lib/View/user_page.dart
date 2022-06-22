import 'package:flutter/material.dart';
import 'package:front/Controller/user_page_controller.dart';
import 'package:get/get.dart';

class UserPage extends GetView<UserPageController> {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("유저페이지"),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CommonBoardDetailPageController extends GetxController {
  final TextEditingController commentEditingController =
      TextEditingController();

  @override
  void onClose() {
    super.onClose();
    commentEditingController.dispose();
  }
}

import 'package:get/get.dart';

class InitPageController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Get.offAndToNamed('/login');
  }
}

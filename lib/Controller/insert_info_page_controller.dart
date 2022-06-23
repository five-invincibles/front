import 'package:get/get.dart';
import 'package:front/Connect/UserProvider.dart';

class InsertInfoPageController extends GetxController {
  final userProvider = Get.put(UserProvider());

  void getUniversity() async {
    var res = await userProvider.getUniversities();
    print(res);
  }
}

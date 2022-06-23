import 'package:get/get.dart';
import 'package:front/Connect/UserProvider.dart';

class InsertInfoPageController extends GetxController {
  final userProvider = Get.put(UserProvider());

  RxList<String> university = RxList();

  void getUniversity() async {
    var res = await userProvider.getUniversities();
    university.value = List<String>.from(res.body["universities"]).toList();
  }
}

import 'package:get/get.dart';

class InsertCatInfoController extends GetxController {
  static InsertCatInfoController get to => Get.find();
  String? _name;
  RxString _specise = RxString("고등어");
  RxString _age = RxString("미상");
  RxString _sex = RxString("미상");
  List<String> _alert = [];

  RxString? get species => _specise;
  String? get name => _name;
  RxString? get age => _age;
  RxString? get sex => _sex;

  void setSpecies(String specise) {
    _specise.value = specise;
    update();
  }

  void setAge(String age) {
    _age.value = age;
    update();
  }

  void setSex(String sex) {
    _sex.value = sex;
    update();
  }
}

import 'package:get/get.dart';

class InsertCatInfoController extends GetxController {
  static InsertCatInfoController get to => Get.find();
  String? _name;
  RxString _specise = RxString("고등어");
  RxString _age = RxString("미상");
  RxString _sex = RxString("미상");
  RxList<String> _alert = RxList();
  List<String> _tmpAlert = [];

  String? get name => _name;
  String get species => _specise.value;
  String get age => _age.value;
  String get sex => _sex.value;
  List<String> get alert => RxList.of(_alert);

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

  void setTmpAlert(List<String> list) {
    _tmpAlert = list;
  }

  void applyAlert() {
    _alert.value = _tmpAlert;
  }
}

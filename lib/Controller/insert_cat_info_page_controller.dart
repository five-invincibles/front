import 'dart:io';
import 'package:get/get.dart';
import 'package:front/Connect/CatProvider.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:front/Model/lat_long.dart';
import 'package:front/Connect/hope.dart';

class InsertCatInfoController extends GetxController {
  static InsertCatInfoController get to => Get.find();
  CatProvider catProvider = Get.put(CatProvider());

  String? _name;
  String? _imagePath;
  double? _latitude;
  double? _longitude;
  RxString _specise = RxString("고등어");
  RxString _age = RxString("미상");
  RxString _sex = RxString("미상");
  RxList<String> _alert = RxList();
  List<String> _tmpAlert = [];
  String? _date;

  String? get name => _name;
  String get species => _specise.value;
  String get age => _age.value;
  String get sex => _sex.value;
  List<String> get alert => RxList.of(_alert);

  Map<String, String> convertAge = {
    "1살 미만": "lessOne",
    "1살 이상 ~ 10살 이하": "lessTen",
    "10살 이상": "moreTen",
    "미상": "unknown",
  };

  void setName(String name) {
    _name = name;
  }

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

  void setData(String path, double latitude, double longitude, String date) {
    _latitude = latitude;
    _longitude = longitude;
    _imagePath = path;
    _date = date;
  }

  Map<String, dynamic> toDMS(double fd) {
    int degree = fd.toInt();
    fd = (fd - degree) * 60;
    int minute = fd.toInt();
    double second = (fd - minute) * 60;
    return {
      "degree": degree,
      "minute": minute,
      "second": second,
    };
  }

  String convertDate(String date) {
    List<String> tmp = date.split(' ')[0].split(":");
    return "${tmp[0]}-${tmp[1]}-${tmp[2]}";
  }

  void registerCat() async {
    AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
    hope().upload(File(_imagePath!));
    // final data = await catProvider.postRegister({
    //   "catName": _name,
    //   "species": _specise.value,
    //   "age": convertAge[_age.value],
    //   "sex": _sex.value,
    //   "datails": alert,
    //   "pictureRequest": {
    //     "latitude": toDMS(_latitude!),
    //     "longitude": toDMS(_longitude!),
    //     "catID": 0,
    //     "kakaoID": tokenInfo.id,
    //     "date": convertDate(_date!),
    //   }
    // }, _imagePath!);
    // print(data.body);
  }
}

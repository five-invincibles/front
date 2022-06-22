import 'package:get/get.dart';

import '../Model/Cat.dart';

class ChooseCatController extends GetxController {
  static ChooseCatController get to => Get.find();

  Map<String, dynamic> arguments = {};
  String? get image => arguments["image"];
  String? get longitude => arguments["longitude"];
  String? get latitude => arguments["latitude"];
  String? get date => arguments["date"];
  List<Cat> get cats => _cats;

  List<Cat> _cats = [
    Cat(catId: 0, catName: "냥진이", species: "얼룩"),
    Cat(catId: 1, catName: "치즈", species: "치즈"),
    Cat(catId: 2, catName: "금이", species: "치즈태비"),
    Cat(catId: 3, catName: "청냥", species: "고등어태비"),
    Cat(catId: 4, catName: "얼룩이", species: "깻잎"),
    Cat(catId: 5, catName: "네로", species: "까망"),
    Cat(catId: 7, catName: "샤곰이", species: "샴"),
    Cat(catId: 8, catName: "카오스", species: "카오스"),
    Cat(catId: 9, catName: "샤곰이", species: "샴"),
    Cat(catId: 10, catName: "야생사과", species: "고등어태비"),
    Cat(catId: 11, catName: "애옹이", species: "얼룩"),
    Cat(catId: 12, catName: "안냥이", species: "치즈"),
    Cat(catId: 13, catName: "나로", species: "정장"),
    Cat(catId: 14, catName: "이마트", species: "삼색태비"),
    Cat(catId: 15, catName: "공냥이", species: "까망"),
    Cat(catId: 15, catName: "하양이", species: "하양"),
  ];

  void setData(Map<String, dynamic> data) {
    arguments = data;
    update();
  }

  void getCats(List<Map<String, dynamic>> jsonData) {
    List<Cat> result = [];
    jsonData.map((item) => {cats.add(Cat.fromJson(item))});
    _cats = result;
    update();
  }
}

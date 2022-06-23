import 'package:get/get.dart';

import '../Model/Cat.dart';

class UserPageController extends GetxController {
  final cats = <Cat>[
    Cat(catId: 0, catName: "냥진이", species: "얼룩"),
    Cat(catId: 1, catName: "치즈", species: "치즈"),
    Cat(catId: 2, catName: "금이", species: "치즈태비"),
    Cat(catId: 3, catName: "청냥", species: "고등어태비"),
    Cat(catId: 4, catName: "얼룩이", species: "깻잎"),
    Cat(catId: 5, catName: "네로", species: "까망"),
    Cat(catId: 7, catName: "샤곰이", species: "샴"),
  ];
}

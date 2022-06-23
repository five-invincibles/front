import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:front/Controller/choose_cat_controller.dart';

class Bottom extends StatelessWidget {
  Bottom({Key? key}) : super(key: key);

  TextStyle _isNoTextStyle = const TextStyle(
    fontSize: 14,
    color: Color(0xff667080),
  );

  TextStyle _addTextStyle = const TextStyle(
    fontSize: 14,
    color: Color(0xffC9CFDB),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF5F5F5),
      padding: EdgeInsets.only(bottom: 19, top: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "해당 목록에 고양이가 없나요?",
            style: _isNoTextStyle,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('insertCat', arguments: {
                "image": Get.find<ChooseCatController>().image,
                "longitude": Get.find<ChooseCatController>().longitude,
                "latitude": Get.find<ChooseCatController>().latitude,
                "date": Get.find<ChooseCatController>().date,
              });
            },
            child: Text("추가하기", style: _addTextStyle),
          )
        ],
      ),
    );
  }
}

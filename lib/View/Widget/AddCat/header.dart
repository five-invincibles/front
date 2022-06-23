import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  Header({Key? key}) : super(key: key);
  TextStyle _textStyle = const TextStyle(
    fontSize: 20,
    color: Color(0xff667080),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      width: double.infinity,
      height: 96,
      decoration: BoxDecoration(
        color: Color(0xffFCFCFC),
        border: Border(bottom: BorderSide(width: 1, color: Color(0xffF0F0F0))),
      ),
      child: Column(children: [
        SizedBox(height: 59),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back, color: Color(0xff667080),)),
            Text("새로운 고양이 추가하기", style: _textStyle),
            GestureDetector(onTap: () {
              // Todo 확인 버튼
            }, child: Icon(Icons.check, color: Color(0xff667080),)),
          ],
        )
      ]),
    );
  }
}

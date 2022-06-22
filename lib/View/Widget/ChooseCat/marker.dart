import 'package:flutter/material.dart';

import '../../../Model/Cat.dart';

class Marker extends StatelessWidget {
  TextStyle _nameTextStyle = const TextStyle(
      fontSize: 14,
    );


  Map<String, String> markerPath = {
    "샴": "Group18.png",
    "정장": "Group19.png",
    "까망": "Group20.png",
    "깻잎": "Group31.png",
    "얼룩": "Group30.png",
    "하양": "Group29.png",
    "카오스": "Group26.png",
    "삼색태비": "Group27.png",
    "삼색": "Group28.png",
    "고등어태비": "Group25.png",
    "고등어": "Group23.png",
    "치즈태비": "Group22.png",
    "치즈": "Group21.png",
  };

  late Cat cat;
  Marker({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/marker/${markerPath[cat.species] ?? 'Group18.png'}"),
        Text(cat.catName, style: _nameTextStyle,),
      ],
    );
  }
}

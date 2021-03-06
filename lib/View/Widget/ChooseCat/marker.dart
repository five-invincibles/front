import 'package:flutter/material.dart';

import '../../../Model/Cat.dart';

class Marker extends StatelessWidget {
  TextStyle _nameTextStyle = const TextStyle(
      fontSize: 14,
    );

  Map<String, String> markerPath = {
    "샴": "sham.png",
    "정장": "suit.png",
    "까망": "black.png",
    "깻잎": "leaf.png",
    "얼룩": "cow.png",
    "하양": "white.png",
    "카오스": "chaos.png",
    "삼색태비": "threetab.png",
    "삼색": "three.png",
    "고등어태비": "fishtab.png",
    "고등어": "fish.png",
    "치즈태비": "cheesetab.png",
    "치즈": "cheese.png",
  };

  final Cat cat;
  final double? width;
  final double? height;
  final double? fontsize;
  Marker({Key? key, required this.cat, this.width, this.height, this.fontsize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle _nameTextStyle = TextStyle(
      fontSize: fontsize ?? 14,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/marker/${markerPath[cat.species] ?? 'fish.png'}",
          width: width,
          height: height,
          fit: BoxFit.fill,
        ),
        Text(
          cat.catName,
          style: _nameTextStyle,
        ),
      ],
    );
  }
}

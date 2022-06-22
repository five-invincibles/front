import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Model/Cat.dart';
import '../../../Controller/choose_cat_controller.dart';
import './marker.dart';

class MarkerList extends StatelessWidget {
  const MarkerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Cat> cats = ChooseCatController.to.cats;
    return Container(
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: cats.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Marker(cat: cats[index]);
          }),
    );
  }
}

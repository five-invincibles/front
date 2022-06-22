import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:front/Controller/choose_cat_controller.dart';
import 'package:get/get.dart';

import './Widget/ChooseCat/header.dart';
import './Widget/ChooseCat/markerList.dart';
import './Widget/ChooseCat/bottom.dart';

class ChooseCat extends GetView<ChooseCatController> {
  ChooseCat({Key? key}) : super(key: key);

  TextStyle _whoTextStyle = const TextStyle(
    fontSize: 14,
    color: Color(0xff667080),
  );

  

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChooseCatController());

    void getData() async {
      controller.setData(await Get.arguments);
    }

    getData();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xffF5F5F5),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 107),
                  Container(
                      width: 300,
                      height: 300,
                      child: FutureBuilder(
                        future: _fetchImage(),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData == false) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey
                              ),
                            );
                          } else {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.file(File(snapshot.data), fit: BoxFit.cover));
                          }
                        },
                      )),
                  SizedBox(height: 23),
                  Container(
                      padding: EdgeInsets.only(left: 23),
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: Text("누구인가요?", style: _whoTextStyle)),
                  MarkerList(),
                  SizedBox(height: 59)
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Header(),
              Bottom(),
            ]
          )
        ],
      ),
    );
  }

  Future<String> _fetchImage() async {
    final data = await Get.arguments;
    return data['image'];
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:front/Controller/insert_cat_info_page_controller.dart';
import 'package:front/Controller/insert_info_page_controller.dart';
import 'package:front/View/Widget/AddCat/header.dart';
import 'package:front/Model/Cat.dart';
import 'package:front/View/Widget/ChooseCat/marker.dart';
import 'package:front/View/Widget/ChooseCat/chooseAlert.dart';
import 'package:get/get.dart';

class InsertCatInfoPate extends GetView<InsertInfoPageController> {
  InsertCatInfoPate({Key? key}) : super(key: key);
  final TextStyle _nameTextStyle = const TextStyle(fontSize: 32);
  final TextStyle _selectTextStyle =
      const TextStyle(fontSize: 16, color: Color(0xff667080));

  List<Cat> _cats = [
    Cat(catId: 0, catName: "치즈", species: "치즈"),
    Cat(catId: 1, catName: "치즈태비", species: "치즈태비"),
    Cat(catId: 2, catName: "고등어", species: "고등어"),
    Cat(catId: 3, catName: "고등어태비", species: "고등어태비"),
    Cat(catId: 4, catName: "삼색", species: "삼색"),
    Cat(catId: 5, catName: "삼색태비", species: "삼색태비"),
    Cat(catId: 7, catName: "카오스", species: "카오스"),
    Cat(catId: 8, catName: "하양", species: "하양"),
    Cat(catId: 9, catName: "얼룩", species: "얼룩"),
    Cat(catId: 10, catName: "깻잎", species: "깻잎"),
    Cat(catId: 11, catName: "까망", species: "까망"),
    Cat(catId: 12, catName: "정장", species: "정장"),
    Cat(catId: 13, catName: "샴", species: "샴"),
  ];

  List<String> _ages = ["1살 미만", "1살 이상 ~ 10살 이하", "10살 이상", "미상"];

  List<String> _sex = ["암컷", "수컷", "암컷(중성화)", "수컷(중성화)", "미상"];

  @override
  Widget build(BuildContext context) {
    Get.put(InsertInfoPageController());
    // 종 선택
    void _showMarkerDialog() async {
      String result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("종 선택"),
            content: Container(
              height: 450,
              width: 300,
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _cats.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 90,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.pop(context, _cats[index].species);
                        },
                        child: Marker(cat: _cats[index]));
                  }),
            ),
            actions: <Widget>[
              TextButton(
                child: new Text("취소"),
                onPressed: () {
                  Navigator.pop(context, InsertCatInfoController.to.species);
                },
              ),
            ],
          );
        },
      );
      InsertCatInfoController.to.setSpecies(result);
    }

    // 나이 선택
    void _showAgeDialog() async {
      String result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("나이 선택"),
            content: Container(
              height: 200,
              width: 200,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _ages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Column(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context, _ages[index]);
                                },
                                child: Text(_ages[index])),
                            Divider(),
                          ],
                        ));
                  }),
            ),
            actions: <Widget>[
              TextButton(
                child: new Text("취소"),
                onPressed: () {
                  Navigator.pop(context, InsertCatInfoController.to.age);
                },
              ),
            ],
          );
        },
      );
      InsertCatInfoController.to.setAge(result);
    }

    // 성별 선택
    void _showSexDialog() async {
      String result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("성별 선택"),
            content: Container(
              height: 200,
              width: 200,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _sex.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Column(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context, _sex[index]);
                                },
                                child: Text(_sex[index])),
                            Divider(),
                          ],
                        ));
                  }),
            ),
            actions: <Widget>[
              TextButton(
                child: new Text("취소"),
                onPressed: () {
                  Navigator.pop(context, InsertCatInfoController.to.sex);
                },
              ),
            ],
          );
        },
      );
      InsertCatInfoController.to.setSex(result);
    }

    // 주의사항 선택
    void _showAlert() async {
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("주의사항 선택"),
            content: ChooseAlert(),
            actions: <Widget>[
              TextButton(
                child: new Text("확인"),
                onPressed: () {
                  InsertCatInfoController.to.applyAlert();
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: new Text("취소"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }

    TextEditingController inputController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(),
          Container(
              padding: EdgeInsets.only(left: 23, right: 23),
              child: Column(children: [
                SizedBox(
                  height: 20,
                  width: double.infinity,
                ),
                Row(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        width: 200,
                        height: 200,
                        child: FutureBuilder(
                          future: _fetchImage(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData == false) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey),
                              );
                            } else {
                              return Container(
                                width: 200,
                                height: 200,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.file(File(snapshot.data),
                                        fit: BoxFit.cover)),
                              );
                            }
                          },
                        )),
                    Expanded(
                      child: Container(),
                    )
                  ],
                ),
                SizedBox(height: 21),
                TextField(
                  onChanged: (text) {
                    InsertCatInfoController.to.setName(text);
                  },
                  controller: inputController,
                  style: _nameTextStyle,
                  decoration: InputDecoration(
                      hintText: "이름을 입력하세요",
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none),
                )
              ])),
          Divider(),
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 23, right: 23),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("종", style: const TextStyle(fontSize: 16)),
                  GestureDetector(
                    onTap: _showMarkerDialog,
                    child: Obx(() => Text(
                          InsertCatInfoController.to.species,
                          style: _selectTextStyle,
                        )),
                  )
                ]),
          ),
          Divider(),
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 23, right: 23),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("나이", style: const TextStyle(fontSize: 16)),
                  GestureDetector(
                    onTap: () {
                      _showAgeDialog();
                    },
                    child: Obx(() => Text(
                          InsertCatInfoController.to.age,
                          style: _selectTextStyle,
                        )),
                  )
                ]),
          ),
          Divider(),
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 23, right: 23),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("성별", style: const TextStyle(fontSize: 16)),
                  GestureDetector(
                      onTap: () {
                        _showSexDialog();
                      },
                      child: Obx(
                        () => Text(
                          InsertCatInfoController.to.sex,
                          style: _selectTextStyle,
                        ),
                      ))
                ]),
          ),
          Divider(),
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 23, right: 23),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("주의사항", style: const TextStyle(fontSize: 16)),
                  GestureDetector(
                      onTap: () {
                        _showAlert();
                      },
                      child: Obx(
                        () => Text(
                          InsertCatInfoController.to.alert.length == 0
                              ? "선택"
                              : "${InsertCatInfoController.to.alert[0]} 등 ${InsertCatInfoController.to.alert.length} 개",
                          style: _selectTextStyle,
                        ),
                      ))
                ]),
          ),
        ],
      ),
    );
  }

  Future<String> _fetchImage() async {
    final data = await Get.arguments;
    InsertCatInfoController.to.setData(data['image'], data['latitude'], data['longitude'], data['date']);
    return data['image'];
  }
}

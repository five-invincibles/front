import 'package:flutter/material.dart';
import 'package:front/Controller/cat_map_page_controller.dart';
import 'package:get/get.dart';

class PannelContent extends StatelessWidget {
  late int catId;
  PannelContent({Key? key, required this.catId}) : super(key: key);

  final TextStyle _nameTextStyle = const TextStyle(
    fontSize: 32,
  );

  final TextStyle _subTextStyle = const TextStyle(
    fontSize: 14,
    color: Color(0xff667080),
  );

  final TextStyle _secondSubTextStyle = const TextStyle(
    fontSize: 10,
    color: Color(0xff667080),
  );

  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16, 37, 16, 30),
                height: 267,
                width: double.infinity,
                child: Row(children: [
                  Container(
                    width: 200,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              alignment: Alignment.topRight,
                              child: Icon(Icons.favorite)),
                          Expanded(child: Container()),
                          Text(
                              CatMapPageController
                                  .to.catPannelInfo!.value.catName,
                              style: _nameTextStyle),
                          Text(
                              CatMapPageController
                                  .to.catPannelInfo!.value.species,
                              style: _subTextStyle),
                          Text(
                              "${CatMapPageController.to.catPannelInfo!.value.sex ?? "미상"}|${CatMapPageController.to.catPannelInfo!.value.age ?? "미상"}",
                              style: _secondSubTextStyle)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ]),
              ),
              Row(children: [
                Container(
                    padding: EdgeInsets.only(left: 25, right: 10),
                    child: Icon(Icons.room_outlined, color: Color(0xffFEBB6C))),
                Text("대운동장 앞 급식소"),
                Text("-30분 전"),
              ]),
              SizedBox(height: 5),
              Row(children: [
                Container(
                    padding: EdgeInsets.only(left: 25, right: 10),
                    child: Icon(Icons.error_outline, color: Color(0xffFEBB6C))),
                Text("링웜, 비만"),
              ]),
              Divider(),
              Container(
                padding:
                    EdgeInsets.only(left: 15, right: 17, bottom: 12, top: 6),
                child: Row(
                  children: [
                    Icon(Icons.edit_outlined, color: Color(0xffFEBB6C)),
                    Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text("최근 정보 업데이트 하기")),
                    Expanded(child: Container()),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Color(0xff667080),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 6,
                color: Color(0xffF0F0F0),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 12,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 7,
                      crossAxisSpacing: 7,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(color: Colors.grey),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}

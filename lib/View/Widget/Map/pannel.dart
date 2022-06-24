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

  List<String> images = ["https://cdn.ppomppu.co.kr/zboard/data3/2019/1010/m_20191010215009_hgtkdoia.jpg",
  "https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.catcare.or.kr%2Ffiles%2Fattach%2Fimages%2F260%2F649%2F669%2F002%2Fa08d49910ad0937039c7a08815063cf1.jpg&imgrefurl=http%3A%2F%2Fwww.catcare.or.kr%2F%3Fpage%3D44%26mid%3Dtownadop%26category%3D264%26document_srl%3D2669649%26listStyle%3Dviewer&tbnid=yZxfkDKx5W5A0M&vet=12ahUKEwjqprCd98T4AhXDAaYKHU9vAOAQMygVegUIARDxAQ..i&docid=NQKu-iHaV2zsTM&w=1440&h=1080&q=치즈냥&client=safari&ved=2ahUKEwjqprCd98T4AhXDAaYKHU9vAOAQMygVegUIARDxAQ",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPOGrcu0IDPbFRRYOF48EJCqDqPhdl1X5lttThw67dUz-dBPZZf2uFZJyI0yPtxnv2Iuk&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-iXNotjMzMm2unMGOfpaSPnHwBCmoX9MNX03BpIXvSJPEU_qewh8TetolNM7p5rbF4vE&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0LTBBbB4F_TQ7jViLvODyduC694yvW1B2GQ&usqp=CAU",
  "https://newsimg.hankookilbo.com/cms/articlerelease/2021/07/16/f17e0146-55fa-4c54-b78e-0bf88cfe6aab.jpg",
  "https://cdn.crowdpic.net/detail-thumb/thumb_d_F31F6BEFF154DA2102F3DF4B3DDA3C25.jpg",
  "https://cdn.ppomppu1.co.kr/zboard/data3/2020/0514/20200514090648_oxufdycs.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4-rMYwD8U0bwD_iIkdD1nwJ56mk0FLOaFDg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgG9VSBzP223qmGZAD-x4HinnkXq3P2VGD6w&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF2Mvr89LzCw1SQ46umZ4K37W2cat0GWU4wl4-ZTYCSccWs863PMA0oLU0cH5vzFU0PDM&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZU2Mk3G6cC_1enRrPxANZqT2DG9R0lJNHRoMpKHiRPCRHUetDG9QPLON73A3WklMtiPQ&usqp=CAU"];

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
                      child: Image.asset("assets/image/cat1.jpg", fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 좋아요 버튼
                          GestureDetector(
                            onTap: () {
                              CatMapPageController.to.clickLikeButton();
                            },
                            child: Container(
                                alignment: Alignment.topRight,
                                child: CatMapPageController.to.like.value
                                    ? Icon(Icons.favorite,
                                        color: Color(0xffFEBB6C))
                                    : Icon(Icons.favorite_outline,
                                        color: Color(0xffFEBB6C))),
                          ),
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
              GestureDetector(
                onTap: () {
                  Get.toNamed('/updateCat', arguments: {"image": ""});
                },
                child: Container(
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
                        child: Container(child: Image.asset("assets/image/cat1.jpg", fit: BoxFit.cover)),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}

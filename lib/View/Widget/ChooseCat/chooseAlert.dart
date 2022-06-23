import 'package:flutter/material.dart';
import 'package:front/Controller/insert_cat_info_page_controller.dart';
import 'package:get/get.dart';
import 'package:front/Controller/choose_cat_controller.dart';

class ChooseAlert extends StatefulWidget {
  const ChooseAlert({Key? key}) : super(key: key);

  @override
  State<ChooseAlert> createState() => _ChooseAlertState();
}

class _ChooseAlertState extends State<ChooseAlert> {
  final List<String> _alert = [
    "비만",
    "링웜",
    "결막염",
    "임신",
    "출산",
    "대장고양이",
    "구토함",
    "기타"
  ];

  @override
  Widget build(BuildContext context) {
    List<String> _list = [...InsertCatInfoController.to.alert];

    return ListView.builder(
        shrinkWrap: true,
        itemCount: _alert.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  if (_list.contains(_alert[index])) {
                    print("취소");
                    setState(() {
                      _list.remove(_alert[index]);
                    });
                    
                  } else {
                    print("선택");
                    setState(() {
                      _list.add(_alert[index]);
                    });
                  }
                },
                child: Container(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      color: _list.contains(_alert[index])
                          ? Color(0xffF0F0F0)
                          : Color(0xffFFFFFF),
                      child: Text(_alert[index]),
                    ),
              ),
              Divider(),
            ],
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:front/Controller/insert_cat_info_page_controller.dart';
import 'package:get/get.dart';
import 'package:front/Controller/cat_info_update_page_controller.dart';

class ChooseAlert extends StatefulWidget {
  const ChooseAlert({Key? key}) : super(key: key);

  @override
  State<ChooseAlert> createState() => _ChooseAlertState();
}

class _ChooseAlertState extends State<ChooseAlert> {
  late List<String> _list;

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
  void initState() {
    _list = [...CatInfoUpdateController.to.alert];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400, width: 300,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: _alert.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (_list.contains(_alert[index])) {
                      setState(() {
                        _list.remove(_alert[index]);
                      });
                      CatInfoUpdateController.to.setTmpAlert(_list);
                    } else {
                      setState(() {
                        _list.add(_alert[index]);
                      });
                      CatInfoUpdateController.to.setTmpAlert(_list);
                    }
                  },
                  child: Container(
                    width: double.infinity,
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
          }),
    );
  }
}

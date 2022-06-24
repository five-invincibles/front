import 'package:flutter/material.dart';
import 'package:front/Controller/init_page_controller.dart';
import 'package:front/Controller/insert_info_page_controller.dart';
import 'package:front/View/main_page.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:front/View/cat_map_page.dart';

class InsertInfo extends GetView<InsertInfoPageController> {
  InsertInfo({Key? key}) : super(key: key);

  final TextStyle _logoTextStyle = const TextStyle(
    fontSize: 40,
  );
  final TextStyle _subTextStyle = const TextStyle(fontSize: 16);
  final TextStyle _buttonTextStyle = const TextStyle(
    fontSize: 16,
    color: Color(0xffFCFCFC),
  );
  final TextStyle _textStyle = const TextStyle(
    fontSize: 20,
  );
  final TextStyle _textFieldStyle = const TextStyle(
    fontSize: 20,
    color: Color(0xff667080),
  );

<<<<<<< HEAD
  final _searchController = TextEditingController();
  

=======
>>>>>>> b8561ab97c001ebb8646ecda0559cf4efbb91d4a
  @override
  Widget build(BuildContext context) {
    InsertInfoPageController controller = Get.put(InsertInfoPageController());
    final List<String> _suggestions = ["충북대학교", "한림대학교", "연세대학교", "단국대학교", "우송대학교"];
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset("assets/image/insert_info_screen.png",
                fit: BoxFit.cover),
          ),
          Column(
            children: [
              SizedBox(height: 193),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "대학교 명",
                        style: _textStyle,
                      ),
                      SizedBox(height: 19),
                      Container(
                        height: 54,
                        padding: EdgeInsets.only(left: 15),
                        width: screenwidth * 0.9,
                        color: Color(0xffF0F0F0),
                        child: Obx(() => SearchField(
                            searchStyle: _textFieldStyle,
                            suggestionState: Suggestion.expand,
                            suggestionAction: SuggestionAction.next,
                            suggestions: controller.universities
                                .map((e) => SearchFieldListItem(e))
                                .toList(),
                            textInputAction: TextInputAction.next,
                            controller: controller.searchController,
                            hint: '학교 선택',
                            maxSuggestionsInViewPort: 8,
                            itemHeight: 50,
                            onSuggestionTap: (x) {},
                            searchInputDecoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintStyle: _textFieldStyle,
                            ))),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => controller.signUp(),
                child: Container(
                  alignment: Alignment.center,
                  width: 106,
                  height: 48,
                  decoration: BoxDecoration(
                      color: Color(0xffFEBB6C),
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: -5,
                            blurRadius: 20,
                            offset: Offset(0, 10))
                      ]),
                  child: Text(
                    "접속하기",
                    style: _buttonTextStyle,
                  ),
                ),
              ),
              SizedBox(
                height: 126,
              )
            ],
          ),
      ],
      ),
    );
  }
}

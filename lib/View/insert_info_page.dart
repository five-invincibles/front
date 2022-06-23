import 'package:flutter/material.dart';
import 'package:front/Controller/init_page_controller.dart';
import 'package:front/View/main_page.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';

class InsertInfo extends GetView<InitPageController> {
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

  final _searchController = TextEditingController();
  final List<String> _suggestions = [
    '충북대학교',
    '한림대학교',
    '연세대학교',
    '단국대학교',
    '우송대학교',
  ];

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          SizedBox(height: 123),
          Column(
            children: [
              Text("Cature", style: _logoTextStyle),
              Text("우리 주변의 작은 아이를 포착하다.", style: _subTextStyle)
            ],
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "대학교 명",
                    style: _textStyle,
                  ),
                  Container(
                    width: screenwidth * 0.9,
                    color: Color(0xffF0F0F0),
                    child: SearchField(
                        searchStyle: _textFieldStyle,
                        suggestionState: Suggestion.expand,
                        suggestionAction: SuggestionAction.next,
                        suggestions: _suggestions
                            .map((e) => SearchFieldListItem(e))
                            .toList(),
                        textInputAction: TextInputAction.next,
                        controller: _searchController,
                        hint: '학교 선택',
                        maxSuggestionsInViewPort: 8,
                        itemHeight: 50,
                        onSuggestionTap: (x) {},                
                        searchInputDecoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintStyle: _textFieldStyle,
                            )),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Main()),
                  (route) => false);
            },
            child: Container(
              alignment: Alignment.center,
              width: 106,
              height: 48,
              decoration: BoxDecoration(
                color: Color(0xffFEBB6C),
                borderRadius: BorderRadius.circular(6),
              ),
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
    );
  }
}

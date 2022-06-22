import 'package:flutter/material.dart';
import 'package:front/Controller/init_page_controller.dart';
import 'package:front/View/main_page.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';

class InsertInfo extends GetView<InitPageController> {
  InsertInfo({Key? key}) : super(key: key);
  
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Cature"),
            Column(
              children: [
                Text("대학교 명"),
                Container(
                  width: screenwidth * 0.9,
                  color: Colors.grey,
                  child: SearchField(
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
                    
                    ),
                  ),
                ),
              ],
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
                child: Text("접속하기"),
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

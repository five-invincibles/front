import 'package:flutter/cupertino.dart';
import 'package:front/Model/common_board_comment.dart';
import 'package:front/Model/common_board_content.dart';
import 'package:get/get.dart';

class CommonBoardDetailPageController extends GetxController {
  final commentEditingController = TextEditingController();

  final content = CommonBoardContent(
      commentCount: 1,
      contentText:
          '이마트는 보통 어디서 생활하나요?\n저번에는 7관 앞에서 자던데, 오늘은 8관 앞이고...\n항상 자리가 다르네요',
      likeCount: 48,
      photos: [
        'https://external-preview.redd.it/1tKiwkhg0vyQPoTl0P3vn3nz21kvX6ZokjtTik5NYk0.jpg?auto=webp&s=b66c1c8aeec060e5dff7d0f6e6da37dfc2ae0886',
        'http://jjal.today/data/file/gallery/1028612757_uW2TD8am_e764fb8cd1d0aad610a0160313824d7013bb99e8.jpg',
        'https://pbs.twimg.com/media/EAmr-PAWsAEoiWR.jpg'
      ],
      userNick: '즐거운 대학생활');
  final coments = <CommonBoardComment>[
    CommonBoardComment(comentText: '어떡해...\n너무 귀웝다...', userNick: '에기사랑'),
    CommonBoardComment(
        comentText: '어쩜 이런 천사들이 있을까..?\n이래서 지구를 지켜야한다!', userNick: '치즈냥이'),
    CommonBoardComment(
        comentText: '두 고양이들이 학번이 비슷한 거로 알아요ㅋㅋ\n그래도 저렇게까지 붙어있는 사진은 처음보네요!!',
        userNick: '박승희'),
  ];

  @override
  void onClose() {
    super.onClose();
    commentEditingController.dispose();
  }
}

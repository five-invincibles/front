import 'package:front/Model/common_board_tile.dart';
import 'package:get/get.dart';

class CommonBoardController extends GetxController {
  RxList<CommonBoardTile> tiles = <CommonBoardTile>[
    CommonBoardTile(
      tileText: '어제 고등어가 치즈랑 싸우는걸 봤었는데..',
      userNick: '자연대 지박령',
    ),
    CommonBoardTile(
      tileText:
          '오늘자 귀여운 고양이 사진 올립니다.\n참이랑 치즈가 원래이렇게 사이가 좋았나요?\n처음보는 광경에 그저 눈물만..',
      userNick: '고양이사랑',
    ),
    CommonBoardTile(
        tileText: '공대 앞 고양이가 울고 있는데\n이 친구는 누구인가요??',
        userNick: '16년도 새내기',
        imageCount: 2),
  ].obs;
}

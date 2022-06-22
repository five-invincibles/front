import 'package:flutter/material.dart';
import 'package:front/Controller/camera_page_controller.dart';
import 'package:front/Controller/cat_info_page_controller.dart';
import 'package:front/Controller/cat_map_page_controller.dart';
import 'package:front/Controller/choose_cat_controller.dart';
import 'package:front/Controller/common_board_controller.dart';
import 'package:front/Controller/init_page_controller.dart';
import 'package:front/Controller/insert_info_page_controller.dart';
import 'package:front/Controller/kakao_login_controller.dart';
import 'package:front/Controller/main_page_controller.dart';
import 'package:front/Controller/upload_picture_page_controller.dart';
import 'package:front/Controller/user_page_controller.dart';
import 'package:front/View/camera_page.dart';
import 'package:front/View/cat_info_page.dart';
import 'package:front/View/cat_map_page.dart';
import 'package:front/View/choose_cat.dart';
import 'package:front/View/common_board.dart';
import 'package:front/View/init_page.dart';
import 'package:front/View/insert_info_page.dart';
import 'package:front/View/main_page.dart';
import 'package:front/View/upload_picture_page.dart';
import 'package:front/View/user_page.dart';
import 'package:get/get.dart';
import 'View/kakao_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cature',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const InitPage(), bindings: [
          BindingsBuilder.put(() => InitPageController()),
        ]),
        GetPage(name: '/catMap', page: () => CatMapPage(), bindings: [
          BindingsBuilder.put(() => CatMapPageController()),
        ]),
        GetPage(name: '/camera', page: () => const CameraPage(), bindings: [
          BindingsBuilder.put(() => CameraPageController()),
        ]),
        GetPage(name: '/catInfo', page: () => const CatInfoPage(), bindings: [
          BindingsBuilder.put(() => CatInfoPageController()),
        ]),
        GetPage(name: '/chooseCat', page: () => const ChooseCat(), bindings: [
          BindingsBuilder.put(() => ChooseCatController()),
        ]),
        GetPage(
            name: '/commonBoard',
            page: () => const CommonBoard(),
            bindings: [
              BindingsBuilder.put(() => CommonBoardController()),
            ]),
        GetPage(name: '/insertInfo', page: () => const InsertInfo(), bindings: [
          BindingsBuilder.put(() => InsertInfoPageController()),
        ]),
        GetPage(name: '/login', page: () => const KakaoLogin(), bindings: [
          BindingsBuilder.put(() => KakaoLoginController()),
        ]),
        GetPage(name: '/main', page: () => const Main(), bindings: [
          BindingsBuilder.put(() => MainPageController()),
        ]),
        GetPage(
            name: '/uploadPicture',
            page: () => const UploadPicturePage(),
            bindings: [
              BindingsBuilder.put(() => UploadPicturePageController()),
            ]),
        GetPage(name: '/user', page: () => const UserPage(), bindings: [
          BindingsBuilder.put(() => UserPageController()),
        ]),
      ],
    );
  }
}

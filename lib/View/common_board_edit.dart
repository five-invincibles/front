import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:front/Controller/common_board_edit_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CommonBoardEditPage extends GetView<CommonBoardEditPageController> {
  const CommonBoardEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: IconThemeData(color: Color(0xFF667080)),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: const StadiumBorder(),
                textStyle: TextStyle(color: Colors.white, fontSize: 13),
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFFFF971E),
              ),
              child: Text('업로드'),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: TextField(
            controller: controller.editTextController,
            expands: true,
            maxLines: null,
            decoration: const InputDecoration(
                hintText: "\t\t내용을 입력하세요.",
                hintStyle: TextStyle(color: Colors.black87),
                border: InputBorder.none),
          ),
        ),
        Container(
            height: 120,
            width: Get.width,
            color: Color(0xFFFCFCFC),
            child: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.photos.length + 2,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _buildIconBox(Icons.camera_alt_outlined,
                        () => controller.takePicture());
                  }
                  if (index == 1) {
                    return _buildIconBox(
                        Icons.image_outlined, () => controller.selectPicture());
                  }
                  return _buildPhotos(controller.photos.elementAt(index - 2));
                },
              ),
            )),
      ],
    );
  }

  Widget _buildIconBox(IconData icon, VoidCallback onTap) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 18, horizontal: 5),
      width: 84,
      height: 84,
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            side: BorderSide(color: Color(0xFFD9D9D9))),
        child: InkWell(
          onTap: onTap,
          child: Center(
              child: Icon(
            icon,
            size: 25,
            color: Color(0xFF667080),
          )),
        ),
      ),
    );
  }

  Widget _buildPhotos(File elementAt) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 18, horizontal: 5),
      width: 84,
      height: 84,
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            side: BorderSide(color: Color(0xFFD9D9D9))),
        child: InkWell(
          onTap: () {},
          child: Image.file(
            elementAt,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

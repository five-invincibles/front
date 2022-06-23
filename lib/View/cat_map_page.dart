import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/Controller/cat_map_page_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:front/View/Widget/Map/pannel.dart';

class CatMapPage extends GetView<CatMapPageController> {
  CatMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Stack(
        children: [
          _buildBody(),
          _buildFloatingButton(),
          Visibility(
            visible: controller.isShowPannel.value,
            child: SlidingUpPanel(
              header: Container(height: 30, width: double.maxFinite, color: Color(0),),
              minHeight: 267,
              maxHeight: 603,
              panel: PannelContent(catId: 1),
            ),
          ),
        ],
      )),
    );
  }

  Widget _buildBody() {
    return Obx(() => controller.isLoading.value
        ? Center(
            child: Text('Loading'),
          )
        : Stack(
            children: [
              _buildMap(),
              _buildSearch(),
            ],
          ));
  }

  Widget _buildMap() {
    return Obx(() => GoogleMap(
          zoomControlsEnabled: false,
          mapType: MapType.terrain,
          initialCameraPosition: CameraPosition(
              target: LatLng(controller.currentLocation!.value.latitude!,
                  controller.currentLocation!.value.longitude!),
              zoom: 17),
          onMapCreated: (GoogleMapController controller) {
            this.controller.mapController.complete(controller);
          },
          markers: {
            Marker(
                markerId: const MarkerId('current'),
                onTap: () {
                  controller.showPanel();
                },
                position: LatLng(controller.currentLocation!.value.latitude!,
                    controller.currentLocation!.value.longitude!)),
          },
        ));
  }

  Widget _buildSearch() {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.circular(30)),
        margin:
            EdgeInsets.symmetric(vertical: Get.height * 0.05, horizontal: 13),
        height: 44,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(children: [
            Flexible(
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  CupertinoIcons.bars,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ),
            Flexible(
              flex: 7,
              child: TextField(
                controller: controller.searchTextController,
                decoration: InputDecoration(
                    hintText: "우리 고양이는 어디에 있을까?",
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.25)),
                    border: InputBorder.none),
              ),
            ),
            Flexible(
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  CupertinoIcons.search,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildFloatingButton() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.only(bottom: 42, right: 23),
      child: FloatingActionButton(
        elevation: 0,
        highlightElevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        splashColor: Colors.white.withOpacity(0.1),
        hoverColor: Colors.white,
        backgroundColor: Color(0xFFFEBB6C),
        child: const Icon(CupertinoIcons.plus),
        onPressed: () {},
      ),
    );
  }
}

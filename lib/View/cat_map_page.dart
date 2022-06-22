import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front/Controller/cat_map_page_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CatMapPage extends GetView<CatMapPageController> {
  CatMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFloatingButton(),
      body: _buildBody(),
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
                icon: Icon(Icons.menu),
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
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildFloatingButton() {
    return FloatingActionButton(
      elevation: 0,
      highlightElevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      splashColor: Colors.white.withOpacity(0.1),
      hoverColor: Colors.white,
      backgroundColor: Color(0xFFFEBB6C),
      child: const Icon(CupertinoIcons.plus),
      onPressed: () {},
    );
  }
}

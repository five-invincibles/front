import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/Controller/cat_map_page_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:front/View/Widget/Map/pannel.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:front/View/cat_map_page.dart';

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
                  header: Container(
                    height: 30,
                    width: double.maxFinite,
                    color: Color(0),
                  ),
                  minHeight: 267,
                  maxHeight: 603,
                  panel: PannelContent(catId: 1),
                ),
              ),
            ],
          )),
    );
  }

  void showLoading() async {
    await EasyLoading.show(
      status: '지도 불러오는중 ...',
      maskType: EasyLoadingMaskType.clear,
    );
    controller.setMarkerBitmap();
  }

  Widget _buildBody() {
    showLoading();
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
    EasyLoading.dismiss();
    print("latitude ${controller.currentLocation!.value.latitude!}");
    print("longitude ${controller.currentLocation!.value.longitude!}");
    return Obx(() => GoogleMap(
          onTap: (LatLng position) {
            controller.hidePanel();
          },
          onCameraMove: (object) => {
            controller.setCats(object.target.longitude, object.target.latitude)
          },
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
            ...controller.cats.map((cat) {
              return Marker(
                markerId: MarkerId(cat.catId.toString()),
                onTap: () {
                  controller.showPanel();
                },
                position: LatLng(
                    double.parse(cat.latitude!), double.parse(cat.longitude!)),
                icon: controller.markerIcon.value[cat.species] ??
                    BitmapDescriptor.defaultMarker,
              );
            }).toList()
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
        child: Obx(
          () => controller.isFloatingButtonClicked.value
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      heroTag: "camera",
                      elevation: 0,
                      highlightElevation: 0,
                      focusElevation: 0,
                      hoverElevation: 0,
                      splashColor: Color(0x667080).withOpacity(0.1),
                      hoverColor: Color(0x667080),
                      backgroundColor: Color(0xFFFCFCFC),
                      shape: StadiumBorder(
                          side: BorderSide(color: Colors.grey, width: 1)),
                      child: const Icon(Icons.photo_camera_outlined,
                          color: Colors.grey),
                      onPressed: () {
                        Get.toNamed("/camera");
                      },
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FloatingActionButton(
                          heroTag: "image",
                          elevation: 0,
                          highlightElevation: 0,
                          focusElevation: 0,
                          hoverElevation: 0,
                          splashColor: Color(0x667080).withOpacity(0.1),
                          hoverColor: Color(0x667080),
                          backgroundColor: Color(0xFFFCFCFC),
                          shape: StadiumBorder(
                              side: BorderSide(color: Colors.grey, width: 1)),
                          child: const Icon(Icons.image_outlined,
                              color: Colors.grey),
                          onPressed: () {
                            Get.toNamed('uploadPicture');
                          },
                        ),
                        SizedBox(width: 6),
                        FloatingActionButton(
                          heroTag: "close",
                          elevation: 0,
                          highlightElevation: 0,
                          focusElevation: 0,
                          hoverElevation: 0,
                          splashColor: Colors.white.withOpacity(0.1),
                          hoverColor: Colors.white,
                          backgroundColor: Color(0xFFFEBB6C),
                          child: const Icon(Icons.close),
                          onPressed: () {
                            controller.clickFloatingButton();
                          },
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      heroTag: "board",
                      elevation: 0,
                      highlightElevation: 0,
                      focusElevation: 0,
                      hoverElevation: 0,
                      splashColor: Colors.white.withOpacity(0.1),
                      hoverColor: Colors.white,
                      backgroundColor: Color(0xFFFEBB6C),
                      child: const Icon(Icons.article_outlined),
                      onPressed: () {
                        Get.toNamed('/commonBoard');
                      },
                    ),
                    SizedBox(height: 16),
                    FloatingActionButton(
                      heroTag: "open",
                      elevation: 0,
                      highlightElevation: 0,
                      focusElevation: 0,
                      hoverElevation: 0,
                      splashColor: Colors.white.withOpacity(0.1),
                      hoverColor: Colors.white,
                      backgroundColor: Color(0xFFFEBB6C),
                      child: const Icon(CupertinoIcons.plus),
                      onPressed: () {
                        controller.clickFloatingButton();
                      },
                    ),
                  ],
                ),
        ));
  }
}

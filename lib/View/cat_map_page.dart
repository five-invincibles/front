import 'package:flutter/material.dart';
import 'package:front/Controller/cat_map_page_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CatMapPage extends GetView<CatMapPageController> {
  CatMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Obx(() => controller.isLoading.value
        ? Center(
            child: Text('Loading'),
          )
        : _buildMap());
  }

  Widget _buildMap() {
    return GoogleMap(
      mapType: MapType.terrain,
      initialCameraPosition: CameraPosition(
          target: LatLng(controller.currentLocation!.latitude!,
              controller.currentLocation!.longitude!),
          zoom: 25),
      onMapCreated: (GoogleMapController controller) {
        this.controller.mapController.complete(controller);
      },
    );
  }
}

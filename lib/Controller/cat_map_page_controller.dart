import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class CatMapPageController extends GetxController {
  final Completer<GoogleMapController> mapController = Completer();
  LocationData? currentLocation;
  RxBool isLoading = true.obs;

  final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final CameraPosition kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Future _getCurrentLocation() async {
    currentLocation = await Location().getLocation();
  }

  @override
  void onInit() async {
    super.onInit();
    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }
    await _getCurrentLocation();
    isLoading(false);
  }
}

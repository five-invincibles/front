import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class CatMapPageController extends GetxController {
  final Completer<GoogleMapController> mapController = Completer();
  final TextEditingController searchTextController = TextEditingController();
  Rx<LocationData>? currentLocation;
  RxBool isLoading = true.obs;

  Future _getCurrentLocation() async {
    var location = Location();
    currentLocation = (await Location().getLocation()).obs;
    location.onLocationChanged.listen((loc) {
      currentLocation!(loc);
    });
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

  @override
  Future<void> onClose() async {
    (await mapController.future).dispose();
    searchTextController.dispose();
  }
}

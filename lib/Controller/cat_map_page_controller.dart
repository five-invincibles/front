import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:front/Model/Cat.dart';

class CatMapPageController extends GetxController {
  static CatMapPageController get to => Get.find();

  final Completer<GoogleMapController> mapController = Completer();
  final TextEditingController searchTextController = TextEditingController();
  Rx<LocationData>? currentLocation;
  RxBool isLoading = true.obs;
  RxBool isShowPannel = false.obs;
  RxBool isFloatingButtonClicked = false.obs;
  Rx<Cat>? catPannelInfo = Rx<Cat>(Cat(
      catId: 0, catName: "냥진이", species: "얼룩", age: "10살 이상", sex: "암컷(중성화)"));

  Future _getCurrentLocation() async {
    var location = Location();
    currentLocation = (await Location().getLocation()).obs;
    location.onLocationChanged.listen((loc) {
      currentLocation!(loc);
    });
  }

  Future getCatInfo() async {
    // 고양이 정보 받아옴
  }

  void showPanel() {
    isShowPannel.value = !isShowPannel.value;
  }

  void clickFloatingButton() {
    isFloatingButtonClicked.value = !isFloatingButtonClicked.value;
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

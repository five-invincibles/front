import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:front/Model/Cat.dart';
import 'package:flutter/services.dart';
import 'package:front/Connect/CatProvider.dart';
import 'package:front/Model/lat_long.dart';

class CatMapPageController extends GetxController {
  static CatMapPageController get to => Get.find();
  final catProvider = Get.put(CatProvider());

  final Completer<GoogleMapController> mapController = Completer();
  final TextEditingController searchTextController = TextEditingController();
  Rx<LocationData>? currentLocation;
  RxBool isLoading = true.obs;
  RxBool isShowPannel = false.obs;
  RxBool isFloatingButtonClicked = false.obs;
  RxBool like = false.obs;

  RxList<Cat> cats = RxList<Cat>([
    Cat(
        catId: 0,
        catName: "냥진이",
        species: "정장",
        age: "10살 이상",
        sex: "암컷(중성화)",
        latitude: "36.628583",
        longitude: "127.456283"),
    Cat(
        catId: 1,
        catName: "고양이1",
        species: "깻잎",
        age: "10살 이상",
        sex: "암컷(중성화)",
        latitude: "36.628484",
        longitude: "127.457183"),
    Cat(
        catId: 2,
        catName: "고양이2",
        species: "고등어",
        age: "10살 이상",
        sex: "암컷(중성화)",
        latitude: "36.628583",
        longitude: "127.457383"),
    Cat(
        catId: 3,
        catName: "고양이3",
        species: "삼색태비",
        age: "10살 이상",
        sex: "암컷(중성화)",
        latitude: "36.628583",
        longitude: "127.453283"),
    Cat(
        catId: 4,
        catName: "고양이4",
        species: "치즈",
        age: "10살 이상",
        sex: "암컷(중성화)",
        latitude: "36.628453",
        longitude: "127.457293"),
    Cat(
        catId: 5,
        catName: "고양이5",
        species: "샴",
        age: "10살 이상",
        sex: "암컷(중성화)",
        latitude: "36.627453",
        longitude: "127.457293"),
    Cat(
        catId: 6,
        catName: "고양이5",
        species: "카오스",
        age: "10살 이상",
        sex: "암컷(중성화)",
        latitude: "36.627553",
        longitude: "127.456293"),
    Cat(
        catId: 7,
        catName: "고양이5",
        species: "고등어태비",
        age: "10살 이상",
        sex: "암컷(중성화)",
        latitude: "36.627451",
        longitude: "127.457253"),
    Cat(
        catId: 7,
        catName: "고양이5",
        species: "까망",
        age: "10살 이상",
        sex: "암컷(중성화)",
        latitude: "36.626451",
        longitude: "127.457353"),
    Cat(
        catId: 7,
        catName: "고양이5",
        species: "고등어태비",
        age: "10살 이상",
        sex: "암컷(중성화)",
        latitude: "36.627351",
        longitude: "127.457153"),
    Cat(
        catId: 7,
        catName: "고양이5",
        species: "치즈태비",
        age: "10살 이상",
        sex: "암컷(중성화)",
        latitude: "36.627351",
        longitude: "127.457153"),
  ]);

  Rx<Cat>? catPannelInfo = Rx<Cat>(
      Cat(catId: -1, catName: "나비", species: "치즈", age: "1살 이하", sex: "수컷(중성화)"));
  RxMap<String, BitmapDescriptor?> markerIcon = RxMap();

  Future _getCurrentLocation() async {
    var location = Location();
    currentLocation = (await Location().getLocation()).obs;
    location.onLocationChanged.listen((loc) {
      currentLocation!(loc);
    });
  }

  void setCats(double longitude, double latitude) async {
    final result = await catProvider
        .getNearBy(LatLong(longitude: longitude, latitude: latitude));
    print(result.body);
  }

  void initialPanel() {
    catPannelInfo!.value =
        Cat(catId: -1, catName: "나비", species: "치즈", age: "1살 이하", sex: "수컷(중성화)");
  }

  void setPanel(Cat cat) async {
    initialPanel();
    catPannelInfo!.value = cat;
  }

  void showPanel() async {
    isShowPannel.value = true;
  }

  void hidePanel() {
    isShowPannel.value = false;
  }

  void clickFloatingButton() {
    isFloatingButtonClicked.value = !isFloatingButtonClicked.value;
  }

  void clickLikeButton() {
    like.value = !like.value;
  }

  // 마커 변환
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<BitmapDescriptor> convertBitmap(String path) async {
    final Uint8List imageData =
        await getBytesFromAsset("assets/marker/${path}", 100);
    return BitmapDescriptor.fromBytes(imageData);
  }

  void setMarkerBitmap() async {
    Map<String, BitmapDescriptor> bitmapFile = {
      "샴": await convertBitmap("sham.png"),
      "정장": await convertBitmap("suit.png"),
      "까망": await convertBitmap("black.png"),
      "깻잎": await convertBitmap("leaf.png"),
      "얼룩": await convertBitmap("cow.png"),
      "하양": await convertBitmap("white.png"),
      "카오스": await convertBitmap("chaos.png"),
      "삼색태비": await convertBitmap("threetab.png"),
      "삼색": await convertBitmap("three.png"),
      "고등어태비": await convertBitmap("fishtab.png"),
      "고등어": await convertBitmap("fish.png"),
      "치즈태비": await convertBitmap("cheesetab.png"),
      "치즈": await convertBitmap("cheese.png"),
    };
    markerIcon.value = bitmapFile;
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

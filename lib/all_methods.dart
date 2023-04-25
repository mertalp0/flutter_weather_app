import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'location_controller.dart';

Future<Position> getLocation() async {
  late Position getPosition;
  final geolocatorController = Get.put(GeolocatorController());
  await Geolocator.requestPermission().then((request) async {
    //   print("REQUEST : $request");
    if (request != LocationPermission.whileInUse) {
      //  print("NOT LOCATION PERMISSION");
      return;
    } else {
      //  print("PERMISSION OK");
      getPosition = await (geolocatorController.permissionOK());
    }
  });
  return getPosition;
}

Future<Placemark> getLocationFromAddress(
    double latitude, double longitude) async {
  // print("object");
  // print(latitude);
  // print(longitude);

  List<Placemark> placemarks =
      await (placemarkFromCoordinates(latitude, longitude));
  Placemark placemark = placemarks.first;
  // print('Country: ${placemark.country}');
  // print('City: ${placemark.administrativeArea}');
  return placemark;
}

String toEnglish(String str) {
  str = str.toLowerCase();
  String newString = str
      .replaceAll("ç", "c")
      .replaceAll("ı", "i")
      .replaceAll("ş", "s")
      .replaceAll("ğ", "g")
      .replaceAll("ö", "o")
      .replaceAll("ü", "u");
  return newString;
}
  String degree(String degree) {
    int pointIndex = degree.indexOf('.');
    String newString = degree.substring(0, pointIndex);
    return newString;
  }
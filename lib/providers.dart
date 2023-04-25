
import 'package:dio/dio.dart';
import 'package:flutter_havadurumu/models/weather_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'all_methods.dart';



final httpClientProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(
      baseUrl:
          'https://api.collectapi.com/weather/',
      headers: {
      'content-type': "application/json",
    'authorization': "apikey YOUR_TOKEN"
       
        }));
});

final myprovider = FutureProvider<List<Weather>>((ref) async {
  final dio = ref.watch(httpClientProvider);
    final adress = ref.watch(getAdress);
     String il = "aydin";
  il = toEnglish(adress.value!.administrativeArea.toString());
  

  final result = await dio.get('getWeather?data.lang=tr&data.city=$il');
  List<Map<String, dynamic>> mapData = List.from(result.data['result']);
  List<Weather> list = mapData.map((e) => Weather.fromMap(e)).toList();
  return list;
});


final getAdress = FutureProvider<Placemark>(((ref) async {
  Position location = await getLocation();
  return await (getLocationFromAddress(location.latitude, location.longitude));
}));

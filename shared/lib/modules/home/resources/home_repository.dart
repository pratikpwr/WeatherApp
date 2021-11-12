import 'package:api/api.dart';

class HomeRepository {
  Future<dynamic> getHomeData(
      {required double lat,
      required double long,
      String unit = 'metric',
      String exclude = ""}) async {
    final response = await ApiSdk.oneCallApi(
        lat: lat, long: long, exclude: exclude, unit: unit);
    return response;
  }

  Future<dynamic> getLocationName(
      {required double lat, required double long}) async {
    final response = await ApiSdk.getLocationName(lat: lat, long: long);
    return response;
  }
}

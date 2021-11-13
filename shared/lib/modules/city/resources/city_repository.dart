import 'package:api/api.dart';

class CityRepository {
  Future<dynamic> getCityWeather(
      {required String city, String unit = 'metric'}) async {
    final _response = await ApiSdk.getCityWeather(city: city, unit: unit);
    return _response;
  }
}

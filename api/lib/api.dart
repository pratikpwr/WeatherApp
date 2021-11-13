library api;

import 'package:api/rest/api_helpers/api_base_helper.dart';
import 'package:api/secrets.dart';
import 'package:dio/dio.dart';

class ApiSdk {
  static final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();
  static const String _baseUrl = "https://api.openweathermap.org/data/2.5";

  static Future<Response> oneCallApi(
      {required double lat,
      required double long,
      required String unit,
      required String exclude}) async {
    final query =
        "lon=$long&lat=$lat&appid=$apiKey&units=$unit&exclude=$exclude";
    final path = "$_baseUrl/onecall?$query";

    Response response = await _apiBaseHelper.get(path);
    return response;
  }

  static Future<Response> oneCallHistoryApi(
      {required double lat,
      required double long,
      required String unit,
      required int dt}) async {
    final query = "lon=$long&lat=$lat&appid=$apiKey&units=$unit&dt=$dt";
    final path = "$_baseUrl/onecall/timemachine?$query";

    Response response = await _apiBaseHelper.get(path);
    return response;
  }

  static Future<Response> getCityWeather(
      {required String city, required String unit}) async {
    final query = "q=$city&appid=$apiKey&units=$unit";
    final path = "$_baseUrl/weather?$query";

    Response response = await _apiBaseHelper.get(path);
    return response;
  }

  static Future<Response> getLocationName({
    required double lat,
    required double long,
  }) async {
    final query = "latlng=$lat,$long&key=$googleKey&sensor=true";
    final path = "https://maps.googleapis.com/maps/api/geocode/json?$query";

    Response response = await _apiBaseHelper.get(path);
    return response;
  }
}

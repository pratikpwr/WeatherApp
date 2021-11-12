library api;

import 'package:api/rest/api_helpers/api_base_helper.dart';
import 'package:dio/dio.dart';

class ApiSdk {
  static final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();
  static const String _baseUrl = "https://api.openweathermap.org/data/2.5";
  static const String _apiKey = "c2244bfdf7f3262c530985717be5974e";
  static const String _googleKey = "AIzaSyAFv8KHiwoyUTTErSjwBtiPQJgEgf9l-aM";

  static Future<Response> oneCallApi(
      {required double lat,
      required double long,
      required String unit,
      required String exclude}) async {
    final query =
        "lon=$long&lat=$lat&appid=$_apiKey&units=$unit&exclude=$exclude";
    final path = "$_baseUrl/onecall?$query";

    Response response = await _apiBaseHelper.get(path);
    return response;
  }

  static Future<Response> oneCallHistoryApi(
      {required double lat,
      required double long,
      required String unit,
      required int dt}) async {
    final query = "lon=$long&lat=$lat&appid=$_apiKey&units=$unit&dt=$dt";
    final path = "$_baseUrl/onecall/timemachine?$query";

    Response response = await _apiBaseHelper.get(path);
    return response;
  }

  static Future<Response> getLocationName({
    required double lat,
    required double long,
  }) async {
    final query = "latlng=$lat,$long&key=$_googleKey&sensor=true";
    final path = "https://maps.googleapis.com/maps/api/geocode/json?$query";

    Response response = await _apiBaseHelper.get(path);
    return response;
  }
}

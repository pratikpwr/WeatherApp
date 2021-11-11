library api;

import 'package:api/rest/api_helpers/api_base_helper.dart';
import 'package:dio/dio.dart';

class ApiSdk {
  static final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();
  static const String BASE_URL = "";
  static const String API_KEY = "c2244bfdf7f3262c530985717be5974e";

// static Future<Response> loginWithEmailAndPassword(
//     {required userAuthData}) async {
//   String path = ApiConstants.LOGIN;

//   Map<String, dynamic> body = userAuthData;

//   Response response = await _apiBaseHelper.post(path, body);
//   return response;
// }

// static Future<Response> appVersion() async {
//   String path = ApiConstants.GET_APP_VERSION;

//   Response response = await _apiBaseHelper.get(path);
//   return response;
// }
}

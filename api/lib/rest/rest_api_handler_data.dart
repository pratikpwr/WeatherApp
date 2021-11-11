import 'package:api/rest/api_helpers/api_base_helper.dart';
import 'package:dio/dio.dart';

class RestApiHandlerData {
  static final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();

  static Future<Response> getData(String path) async {
    Response response = await _apiBaseHelper.get(path);
    return response;
  }

  static Future<Response> postData(String path, dynamic body) async {
    Response response = await _apiBaseHelper.post(path, body);
    return response;
  }

  static Future<Response> putData(String path, dynamic body) async {
    Response response = await _apiBaseHelper.put(path, body);
    return response;
  }

  static Future<Response> deleteData(String path, {dynamic body}) async {
    Response response = await _apiBaseHelper.delete(path, data: body);
    return response;
  }
}

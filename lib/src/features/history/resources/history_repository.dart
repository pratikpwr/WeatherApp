import '../../../core/constants/app_constants.dart';
import '../../../core/network/api_base_helper.dart';
import '../../../core/utils/secrets.dart';

class HistoryRepository {
  final _apiBaseHelper = ApiBaseHelper();

  Future<dynamic> getHistoryData({
    required double lat,
    required double long,
    String unit = 'metric',
    required int dt,
  }) async {
    final query = "lon=$long&lat=$lat&appid=$apiKey&units=$unit&dt=$dt";
    final path = "$baseUrl/onecall/timemachine?$query";

    final response = await _apiBaseHelper.get(path);
    return response;
  }
}

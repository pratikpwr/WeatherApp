import 'package:api/api.dart';

class HistoryRepository {
  Future<dynamic> getHistoryData(
      {required double lat,
      required double long,
      String unit = 'metric',
      required int dt}) async {
    final response = await ApiSdk.oneCallHistoryApi(
        lat: lat, long: long, unit: unit, dt: dt);
    return response;
  }
}

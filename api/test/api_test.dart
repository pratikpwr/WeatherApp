import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:api/api.dart';

void main() {
  test('get location name using lat long', () async {
    Response response =
        await ApiSdk.getLocationName(lat: 20.8326608, long: 74.168528);
    // token = response.data['token'];
    expect('Daregaon',
        response.data['results'][0]["address_components"][1]["long_name"]);
  });
  test('get weather', () async {
    Response response = await ApiSdk.oneCallApi(
        lat: 20.8326608,
        long: 74.168528,
        unit: 'metric',
        exclude: 'minutely,hourly,daily');
    // token = response.data['token'];
    expect("Asia/Kolkata", response.data["timezone"]);
  });
  test('get weather history', () async {
    final curDt = DateTime.now()
            .subtract(const Duration(days: 1))
            .millisecondsSinceEpoch /
        1000;
    Response response = await ApiSdk.oneCallHistoryApi(
        lat: 20.8326608, long: 74.168528, unit: 'metric', dt: curDt.toInt());
    // token = response.data['token'];
    expect("Asia/Kolkata", response.data["timezone"]);
  });
}

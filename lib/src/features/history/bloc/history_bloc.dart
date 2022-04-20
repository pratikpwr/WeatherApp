import 'dart:async';

import 'package:app/src/features/home/models/weather_one_call_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../resources/history_repository.dart';

part 'history_event.dart';

part 'history_state.dart';

const daysLimit = 5;

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial());
  final _hisRepository = HistoryRepository();

  @override
  Stream<HistoryState> mapEventToState(
    HistoryEvent event,
  ) async* {
    if (event is GetHistoryData) {
      yield HistoryLoading();

      try {
        final prefs = await SharedPreferences.getInstance();
        final lat = prefs.getDouble('lat') ?? 20.8327;
        final long = prefs.getDouble('long') ?? 74.1685;

        List<WeatherData> historyData = [];
        final days = fivePreviousDaysUnix();

        for (int i = 0; i < days.length; i++) {
          Response _res = await _hisRepository.getHistoryData(
              lat: lat, long: long, dt: days[i]);

          if (_res.statusCode == 200) {
            final curData = WeatherData.fromJson(_res.data);
            historyData.add(curData);
          } else {
            yield HistoryFailed(_res.data['message']);
          }
        }
        final min = getMinTemp(historyData);
        final max = getMaxTemp(historyData);
        final icon = getIcon(historyData);
        yield HistorySuccess(
            hisWeather: historyData, icon: icon, max: max, min: min);
      } catch (e) {
        yield HistoryFailed(e.toString());
      }
    }
  }
}

List<int> getMinTemp(List<WeatherData> weather) {
  List<int> minTemps = [];

  for (var wea in weather) {
    int minimum = wea.hourly.first.temp;
    for (var hour in wea.hourly) {
      if (minimum > hour.temp) {
        minimum = hour.temp;
      }
    }
    minTemps.add(minimum);
  }
  return minTemps;
}

List<int> getMaxTemp(List<WeatherData> weather) {
  List<int> maxTemps = [];

  for (var wea in weather) {
    int maximum = wea.hourly.first.temp;
    for (var hour in wea.hourly) {
      if (maximum < hour.temp) {
        maximum = hour.temp;
      }
    }
    maxTemps.add(maximum);
  }

  return maxTemps;
}

List<String> getIcon(List<WeatherData> weather) {
  List<String> iconList = [];

  for (var wea in weather) {
    List<String> curList = [];
    for (var hour in wea.hourly) {
      curList.add(hour.weather.first.icon);
    }
    iconList.add(mostFrequent(curList));
  }

  return iconList;
}

List<String> getFivePreviousDays() {
  List<String> days = [];
  final dtNow = DateTime.now();

  for (int i = 0; i < daysLimit; i++) {
    final curDt = dtNow.subtract(Duration(days: i));
    final curDay = DateFormat('EEEE').format(curDt);
    days.add(curDay);
  }
  return days;
}

int getUnixFromDateTime(DateTime dt) {
  double dT = dt.millisecondsSinceEpoch / 1000;
  return dT.toInt();
}

List<int> fivePreviousDaysUnix() {
  List<int> days = [];
  final dtNow = DateTime.now();

  for (int i = 1; i <= daysLimit; i++) {
    final curDt = dtNow.subtract(Duration(days: i));
    final curUnix = getUnixFromDateTime(curDt);
    days.add(curUnix);
  }
  return days;
}

String mostFrequent(List<String> arr) {
  arr.sort();
  int n = arr.length;
  int maxCount = 1;
  String res = arr[0];
  int currCount = 1;

  for (int i = 1; i < n; i++) {
    if (arr[i] == arr[i - 1]) {
      currCount++;
    } else {
      if (currCount > maxCount) {
        maxCount = currCount;
        res = arr[i - 1];
      }
      currCount = 1;
    }
  }
  if (currCount > maxCount) {
    maxCount = currCount;
    res = arr[n - 1];
  }
  return res;
}

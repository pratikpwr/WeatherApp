import 'dart:async';
import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared/modules/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());
  final _repository = HomeRepository();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is GetHomeData) {
      yield HomeLoading();
      final prefs = await SharedPreferences.getInstance();
      prefs.setDouble('lat', event.lat);
      prefs.setDouble('long', event.long);
      try {
        Response response =
            await _repository.getHomeData(lat: event.lat, long: event.long);
        Response gRes =
            await _repository.getLocationName(lat: event.lat, long: event.long);
        // print(response.data);
        if (response.statusCode == 200) {
          final weatherData = WeatherData.fromJson(response.data);

          final place =
              gRes.data['results'][0]["address_components"][1]["long_name"];
          // final gData = GMapData.fromJson(gRes.data);
          // final place = gData.results[0].addressComponents[1].longName;
          yield HomeSuccess(weatherData, place);
        } else {
          yield HomeFailed(response.data['message']);
        }
      } catch (e) {
        yield HomeFailed(e.toString());
      }
    }
  }
}

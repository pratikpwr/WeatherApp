part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();
}

class HistoryInitial extends HistoryState {
  @override
  List<Object> get props => [];
}

class HistoryLoading extends HistoryState {
  @override
  List<Object> get props => [];
}

class HistorySucess extends HistoryState {
  final List<WeatherData> hisWeather;
  final List<int> min;
  final List<int> max;
  final List<String> icon;
  // final List<String> dayInWeek;
  const HistorySucess(
      {required this.hisWeather,
      // required this.dayInWeek,
      required this.min,
      required this.max,
      required this.icon});

  @override
  List<Object> get props => [hisWeather, min, max, icon];
}

class HistoryFailed extends HistoryState {
  final String error;

  const HistoryFailed(this.error);

  @override
  List<Object> get props => [error];
}

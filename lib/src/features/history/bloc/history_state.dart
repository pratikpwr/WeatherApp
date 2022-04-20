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

class HistorySuccess extends HistoryState {
  final List<WeatherData> hisWeather;
  final List<int> min;
  final List<int> max;
  final List<String> icon;

  const HistorySuccess({
    required this.hisWeather,
    required this.min,
    required this.max,
    required this.icon,
  });

  @override
  List<Object> get props => [hisWeather, min, max, icon];
}

class HistoryFailed extends HistoryState {
  final String error;

  const HistoryFailed(this.error);

  @override
  List<Object> get props => [error];
}

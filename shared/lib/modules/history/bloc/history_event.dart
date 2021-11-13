part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();
}

class GetHistoryData extends HistoryEvent {
  @override
  List<Object?> get props => [];
}

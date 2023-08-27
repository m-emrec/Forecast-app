// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

abstract class WeatherActionState extends WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedSuccessState extends WeatherState {
  final WeatherEntity data;
  const WeatherLoadedSuccessState({
    required this.data,
  });
}

class WeatherLoadedFailState extends WeatherState {
  final String error;
  const WeatherLoadedFailState({
    required this.error,
  });
}

////               Action States

class ExpandedViewState extends WeatherActionState {}

class CollapsedViewState extends WeatherActionState {}

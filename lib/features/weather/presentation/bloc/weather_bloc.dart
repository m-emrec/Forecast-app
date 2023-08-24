import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/core/constants/logger.dart';
import 'package:weather/features/weather/domain/usecases/get_weather_data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherDataUseCase _getWeatherDataUseCase;
  WeatherBloc(this._getWeatherDataUseCase) : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) {});
    on<Weather>(onWeathe);
  }

  FutureOr<void> onWeathe(Weather event, Emitter<WeatherState> emit) async {
    logger.i("message");
    final dataState = await _getWeatherDataUseCase.getWeatherData();
    logger.i(dataState.data);
  }
}

import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';
import 'package:weather/features/weather/domain/usecases/get_weather_data.dart';

import '../../../../injection_container.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherDataUseCase _getWeatherDataUseCase;
  WeatherBloc(this._getWeatherDataUseCase) : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) {});
    on<WeatherFetchDataEvent>(onWeatherFetchDataEvent);
    on<CollapsedViewEvent>(onCollapsedViewEvent);
    on<ExpandedViewEvent>(onExpandedViewEvent);
  }

  FutureOr<void> onCollapsedViewEvent(
      CollapsedViewEvent event, Emitter<WeatherState> emit) {
    // logger.i("Collapsed");
    emit(CollapsedViewState());
  }

  FutureOr<void> onExpandedViewEvent(
      ExpandedViewEvent event, Emitter<WeatherState> emit) {
    // logger.i("Expanded");

    emit(ExpandedViewState());
    emit(ExpandedViewState());
  }

  FutureOr<void> onWeatherFetchDataEvent(
      WeatherFetchDataEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());
    final dataState = await _getWeatherDataUseCase.getWeatherData();

    /// if data is loaded successfully emit LoadedSuccessStat
    if (dataState is DataSuccess) {
      emit(
        WeatherLoadedSuccessState(data: dataState.data!),
      );
      sl.registerSingleton<WeatherEntity>(dataState.data!);
    }

    /// if data is not loaded successfully emit LoadedFailState
    if (dataState is DataFailed) {
      emit(
        WeatherLoadedFailState(error: dataState.exception ?? ""),
      );
      logger.e(dataState.exception);
    }
  }
}

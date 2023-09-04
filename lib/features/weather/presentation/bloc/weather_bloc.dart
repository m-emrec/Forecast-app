// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/resources/data_state.dart';
import 'package:weather/core/resources/location_model.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';
import 'package:weather/features/weather/domain/usecases/get_location_use_case.dart';
import 'package:weather/features/weather/domain/usecases/get_weather_data.dart';

import '../../../../injection_container.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherDataUseCase _getWeatherDataUseCase;
  final GetLocationUseCase _getLocationUseCase;
  WeatherBloc(this._getWeatherDataUseCase, this._getLocationUseCase)
      : super(WeatherInitial()) {
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
    logger.i(sl<LocationViewModel>().query);
    final location = await _getLocationUseCase.getLocation();
    if (location is DataSuccess) {
      String _coordinate;
      if (location.data!.isRight) {
        _coordinate = location.data!.right.query ?? "";
      } else {
        final double latitude = location.data!.left.latitude;
        final double longitude = location.data!.left.longitude;
        _coordinate = "$latitude,$longitude";
      }

      final dataState =
          await _getWeatherDataUseCase.getWeatherData(_coordinate);

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
    } else {
      // emit(
      //   WeatherLoadedFailState(error: location.exception ?? " Unknown"),
      // );
    }
  }
}

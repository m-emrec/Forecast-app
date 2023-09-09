// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field, no_leading_underscores_for_local_identifiers
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/search_location/presentation/bloc/search_location_bloc.dart';
import 'package:weather/features/settings/data/models/settings_model.dart';
import 'package:weather/features/settings/domain/entities/settings_entity.dart';

import 'package:weather/features/settings/domain/usecases/change_settings_use_case.dart';
import 'package:weather/features/settings/domain/usecases/get_settings_from_device_use_case.dart';
import 'package:weather/features/settings/domain/usecases/save_settings_use_case.dart';
import 'package:weather/injection_container.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SaveSettingsUseCase _saveSettingsUseCase;
  final GetSettingsFromDeviceUseCase _getSettingsFromDeviceUseCase;
  final ChangeSettingsUseCase _changeSettingsUseCase;
  final SharedPreferences prefs = sl<SharedPreferences>();
  SettingsBloc(
    this._saveSettingsUseCase,
    this._getSettingsFromDeviceUseCase,
    this._changeSettingsUseCase,
  ) : super(SettingsInitial()) {
    on<SettingsEvent>((event, emit) {});
    on<GetSettingsEvent>(onGetSettingsEvent);
    on<ChangeNotificationSettingsEvent>(onChangeNotificationSettingsEvent);
    on<ChangeLocationSettingsEvent>(onChangeLocationSettingsEvent);
    on<ChangeTemperatureSettingsEvent>(onChangeTemperatureSettingsEvent);
    on<ChangeWindSpeedSettingsEvent>(onChangeWindSpeedSettingsEvent);
  }

  FutureOr<void> onGetSettingsEvent(
      GetSettingsEvent event, Emitter<SettingsState> emit) async {
    emit(LoadingSettingsState());
    final DataState dataState = await _getSettingsFromDeviceUseCase();

    if (dataState is DataSuccess) {
      await Future.delayed(const Duration(microseconds: 100000));
      final SettingsEntitiy _settings = dataState.data;
      emit(LoadedSettingsSuccessState(_settings));
    } else {
      emit(
          LoadedSettingsFailState(dataState.exception ?? "An error occured !"));
    }
  }

  FutureOr<void> onChangeNotificationSettingsEvent(
      ChangeNotificationSettingsEvent event,
      Emitter<SettingsState> emit) async {
    // logger.i(event.newVal);
    final dataState = _changeSettingsUseCase(
      SettingsEntitiy(
        allowLocation: prefs.getBool("allowLocation"),
        temperatureUnit: prefs.getString("tempUnit"),
        windSpeedUnit: prefs.getString("windUnit"),
        allowNotification: event.newVal,
      ),
    );
    if (dataState is DataSuccess) {
      logger.i(dataState.data);
      await _saveSettingsUseCase(dataState.data!);
    } else {
      logger.e(dataState.exception);
    }
  }

  FutureOr<void> onChangeLocationSettingsEvent(
      ChangeLocationSettingsEvent event, Emitter<SettingsState> emit) async {
    logger.i(event.newVal);
    final dataState = _changeSettingsUseCase(
      SettingsEntitiy(
        temperatureUnit: prefs.getString("tempUnit"),
        windSpeedUnit: prefs.getString("windUnit"),
        allowNotification: prefs.getBool("allowNotification"),
        allowLocation: event.newVal,
      ),
    );
    if (dataState is DataSuccess) {
      logger.i(dataState.data);
      await _saveSettingsUseCase(dataState.data!);
    } else {
      logger.e(dataState.exception);
    }
  }

  FutureOr<void> onChangeTemperatureSettingsEvent(
      ChangeTemperatureSettingsEvent event, Emitter<SettingsState> emit) async {
    logger.i(event.newVal);
    final dataState = _changeSettingsUseCase(
      SettingsEntitiy(
        allowLocation: prefs.getBool("allowLocation"),
        temperatureUnit: event.newVal,
        windSpeedUnit: prefs.getString("windUnit"),
        allowNotification: prefs.getBool("allowNotification"),
      ),
    );
    if (dataState is DataSuccess) {
      logger.i(dataState.data);
      await _saveSettingsUseCase(dataState.data!);
    } else {
      logger.e(dataState.exception);
    }
  }

  FutureOr<void> onChangeWindSpeedSettingsEvent(
      ChangeWindSpeedSettingsEvent event, Emitter<SettingsState> emit) async {
    logger.i(event.newVal);
    final dataState = _changeSettingsUseCase(
      SettingsEntitiy(
        allowLocation: prefs.getBool("allowLocation"),
        temperatureUnit: prefs.getString("tempUnit"),
        allowNotification: prefs.getBool("allowNotification"),
        windSpeedUnit: event.newVal,
      ),
    );
    if (dataState is DataSuccess) {
      logger.i(dataState.data);
      await _saveSettingsUseCase(dataState.data!);
      emit(LoadedSettingsSuccessState(dataState.data!));
    } else {
      logger.e(dataState.exception);
    }
  }
}

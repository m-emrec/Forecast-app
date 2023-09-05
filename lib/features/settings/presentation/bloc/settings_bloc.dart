// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:weather/features/settings/domain/usecases/change_settings_use_case.dart';
import 'package:weather/features/settings/domain/usecases/get_settings_from_device_use_case.dart';
import 'package:weather/features/settings/domain/usecases/save_settings_use_case.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SaveSettingsUseCase _saveSettingsUseCase;
  final GetSettingsFromDeviceUseCase _getSettingsFromDeviceUseCase;
  final ChangeSettingsUseCase _changeSettingsUseCase;
  SettingsBloc(
    this._saveSettingsUseCase,
    this._getSettingsFromDeviceUseCase,
    this._changeSettingsUseCase,
  ) : super(SettingsInitial()) {
    on<SettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

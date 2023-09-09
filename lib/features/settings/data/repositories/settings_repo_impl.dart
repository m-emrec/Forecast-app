// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/settings/data/models/settings_model.dart';
import 'package:weather/features/settings/domain/entities/settings_entity.dart';
import 'package:weather/features/settings/domain/repositories/settings_repo.dart';
import 'package:weather/injection_container.dart';

class SettingsRepoImpl implements SettingsRepo {
  @override
  DataState<SettingsModel> changeSettings(SettingsEntitiy newSettings) {
    try {
      final SettingsModel _newSettings = SettingsModel().copyWith(
        allowLocation: newSettings.allowLocation,
        allowNotification: newSettings.allowNotification,
        temperatureUnit: newSettings.temperatureUnit,
        windSpeedUnit: newSettings.windSpeedUnit,
      );

      // sl.registerSingletonAsync<bool>(() async => _newSettings.allowLocation!);

      return DataSuccess(_newSettings);
    } catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<SettingsModel>> getSettingsFromDevice() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      final SettingsModel _settings = SettingsModel(
        allowLocation: sl<bool>(), //_prefs.getBool("allowLocation") ?? false,
        allowNotification: _prefs.getBool("allowNotification") ?? false,
        temperatureUnit: _prefs.getString("tempUnit") ?? "celcius",
        windSpeedUnit: _prefs.getString("windUnit") ?? "kph",
      );

      return DataSuccess(_settings);
    } catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<void>> saveSettings(SettingsEntitiy newSettings) async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      await _prefs.setBool("allowLocation", sl<bool>());
      await _prefs.setBool("allowNotification", newSettings.allowNotification!);
      await _prefs.setString("tempUnit", newSettings.temperatureUnit!);
      await _prefs.setString("windUnit", newSettings.windSpeedUnit!);
      return DataSuccess(null);
    } catch (e) {
      return DataFailed(e);
    }
  }
}

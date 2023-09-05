// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/settings/data/models/settings_model.dart';
import 'package:weather/features/settings/domain/entities/settings_entity.dart';
import 'package:weather/features/settings/domain/repositories/settings_repo.dart';

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
        allowLocation: _prefs.getBool("allowLocation"),
        allowNotification: _prefs.getBool("allowNotification"),
        temperatureUnit: _prefs.getString("tempUnit"),
        windSpeedUnit: _prefs.getString("windUnit"),
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
      _prefs.setBool("allowLocation", newSettings.allowLocation!);
      _prefs.setBool("allowNotification", newSettings.allowNotification!);
      _prefs.setString("tempUnit", newSettings.temperatureUnit!);
      _prefs.setString("windUnit", newSettings.windSpeedUnit!);
      return DataSuccess(null);
    } catch (e) {
      return DataFailed(e);
    }
  }
}

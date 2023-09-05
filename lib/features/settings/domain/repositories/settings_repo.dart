import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/settings/domain/entities/settings_entity.dart';

abstract class SettingsRepo {
  ///
  Future<DataState<SettingsEntitiy>> getSettingsFromDevice();

  DataState<SettingsEntitiy> changeSettings(SettingsEntitiy newSettings);

  ///
  Future<DataState<void>> saveSettings(SettingsEntitiy newSettings);
}

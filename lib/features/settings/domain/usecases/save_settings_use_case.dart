import 'package:weather/features/settings/domain/entities/settings_entity.dart';
import 'package:weather/features/settings/domain/repositories/settings_repo.dart';

class SaveSettingsUseCase {
  final SettingsRepo _settingsRepo;

  SaveSettingsUseCase(this._settingsRepo);

  call(SettingsEntitiy newSettings) {
    return _settingsRepo.saveSettings(newSettings);
  }
}

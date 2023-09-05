import 'package:weather/features/settings/domain/repositories/settings_repo.dart';

import '../../../../core/resources/data_state.dart';
import '../entities/settings_entity.dart';

class ChangeSettingsUseCase {
  final SettingsRepo _settingsRepo;

  ChangeSettingsUseCase(this._settingsRepo);

  DataState<SettingsEntitiy> call(SettingsEntitiy newSettings) {
    return _settingsRepo.changeSettings(newSettings);
  }
}

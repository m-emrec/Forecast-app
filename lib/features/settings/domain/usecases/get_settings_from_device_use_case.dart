import 'package:weather/features/settings/domain/repositories/settings_repo.dart';

import '../../../../core/resources/data_state.dart';
import '../entities/settings_entity.dart';

class GetSettingsFromDeviceUseCase {
  final SettingsRepo _settingsRepo;

  GetSettingsFromDeviceUseCase(this._settingsRepo);
  Future<DataState<SettingsEntitiy>> call() {
    return _settingsRepo.getSettingsFromDevice();
  }
}

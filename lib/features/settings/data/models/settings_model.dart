import 'package:weather/features/settings/domain/entities/settings_entity.dart';

class SettingsModel extends SettingsEntitiy {
  SettingsModel({
    temperatureUnit,
    windSpeedUnit,
    allowLocation,
    allowNotification,
  }) : super(
          allowLocation: allowLocation,
          allowNotification: allowNotification,
          temperatureUnit: temperatureUnit,
          windSpeedUnit: windSpeedUnit,
        );

  @override
  SettingsModel copyWith(
      {String? temperatureUnit,
      String? windSpeedUnit,
      bool? allowLocation,
      bool? allowNotification}) {
    return SettingsModel(
      temperatureUnit: temperatureUnit ?? this.temperatureUnit,
      windSpeedUnit: windSpeedUnit ?? this.windSpeedUnit,
      allowLocation: allowLocation ?? this.allowLocation,
      allowNotification: allowNotification ?? this.allowNotification,
    );
  }
}

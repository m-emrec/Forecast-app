// ignore_for_file: public_member_api_docs, sort_constructors_first
enum TemperatureEnum {
  celcius,
  fahrenheit,
}

enum WindSpeedEnum {
  kph,
  mph,
}

class SettingsEntitiy {
  final String? temperatureUnit;
  final String? windSpeedUnit;
  final bool? allowLocation;
  final bool? allowNotification;
  SettingsEntitiy({
    this.temperatureUnit = "celcius",
    this.windSpeedUnit = "kph",
    this.allowLocation = false,
    this.allowNotification = false,
  });

  @override
  String toString() {
    return 'SettingsEntitiy(temperatureUnit: $temperatureUnit, windSpeedUnit: $windSpeedUnit, allowLocation: $allowLocation, allowNotification: $allowNotification)';
  }

  @override
  bool operator ==(covariant SettingsEntitiy other) {
    if (identical(this, other)) return true;

    return other.temperatureUnit == temperatureUnit &&
        other.windSpeedUnit == windSpeedUnit &&
        other.allowLocation == allowLocation &&
        other.allowNotification == allowNotification;
  }

  @override
  int get hashCode {
    return temperatureUnit.hashCode ^
        windSpeedUnit.hashCode ^
        allowLocation.hashCode ^
        allowNotification.hashCode;
  }
}

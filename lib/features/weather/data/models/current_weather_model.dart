// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:weather/features/weather/domain/entities/current_weather_entity.dart';

class CurrentWeatherModel extends CurrentWeatherEntity {
  CurrentWeatherModel({
    DateTime? lastUpdated,
    String? temp,
    bool? isDay,
    String? condition,
    String? wind,
    String? humidity,
    String? uv,
    String? feelsLike,
    String? locationName,
    String? country,
    String? region,
  }) : super(
          condition: condition,
          feelsLike: feelsLike,
          humidity: humidity,
          isDay: isDay,
          lastUpdated: lastUpdated,
          temp: temp,
          uv: uv,
          wind: wind,
          locationName: locationName,
          country: country,
          region: region,
        );

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> source) {
    final Map<String, dynamic> _location = source["location"];

    final String _name = _location["name"];
    final String _country = _location["country"];
    final String _region = _location["region"];

    final Map<String, dynamic> _current = source["current"];
    final _lastUpdated = DateTime.fromMillisecondsSinceEpoch(
        int.parse("${_current["last_updated_epoch"]}000"));

    final Map _condition = _current["condition"];
    return CurrentWeatherModel(
      locationName: _name,
      country: _country,
      lastUpdated: _lastUpdated,
      condition: _condition["text"],
      feelsLike: _current["feelslike_c"].toString(),
      humidity: _current["humidity"].toString(),
      isDay: _current["is_day"] == 1 ? true : false,
      temp: _current["temp_c"].toString(),
      region: _region,
      uv: _current["uv"].toString(),
      wind: _current["wind_kph"].toString(),
    );
  }
}

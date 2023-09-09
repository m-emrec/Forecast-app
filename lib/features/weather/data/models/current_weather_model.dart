// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:weather/core/constants/logger.dart';
import 'package:weather/features/weather/domain/entities/current_weather_entity.dart';

class CurrentWeatherModel extends CurrentWeatherEntity {
  CurrentWeatherModel({
    DateTime? lastUpdated,
    String? temp_c,
    String? temp_f,
    bool? isDay,
    String? condition,
    String? wind_mph,
    String? wind_kph,
    String? humidity,
    String? uv,
    String? feelsLike_c,
    String? feelsLike_f,
    String? locationName,
    String? country,
    String? region,
  }) : super(
          condition: condition,
          feelsLike_c: feelsLike_c,
          humidity: humidity,
          isDay: isDay,
          lastUpdated: lastUpdated,
          temp_c: temp_c,
          temp_f: temp_f,
          uv: uv,
          wind_mph: wind_mph,
          wind_kph: wind_kph,
          locationName: locationName,
          country: country,
          region: region,
          feelsLike_f: feelsLike_f,
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
      feelsLike_c: _current["feelslike_c"].toString(),
      feelsLike_f: _current["feelslike_f"].toString(),
      humidity: _current["humidity"].toString(),
      isDay: _current["is_day"] == 1 ? true : false,
      temp_c: _current["temp_c"].toString(),
      temp_f: _current["temp_f"].toString(),
      region: _region,
      uv: _current["uv"].toString(),
      wind_kph: _current["wind_kph"].toString(),
      wind_mph: _current["wind_mph"].toString(),
    );
  }
}

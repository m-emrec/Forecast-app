// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather/features/weather/domain/entities/current_weather_entity.dart';
import 'package:weather/features/weather/domain/entities/day_entity.dart';

class WeatherEntity {
  final CurrentWeatherEntity? currentWeather;
  final DayEntity? dayWeather;

  WeatherEntity({
    this.currentWeather,
    this.dayWeather,
  });
}

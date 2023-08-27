// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:weather/features/weather/data/models/current_weather_model.dart';
import 'package:weather/features/weather/data/models/day_model.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    CurrentWeatherModel? currentWeather,
    List<DayModel>? dayWeather,
  }) : super(currentWeather: currentWeather, dayWeather: dayWeather);
}

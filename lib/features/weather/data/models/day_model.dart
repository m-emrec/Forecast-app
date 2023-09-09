// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:weather/core/constants/logger.dart';
import 'package:weather/features/weather/data/models/hour_model.dart';
import 'package:weather/features/weather/domain/entities/day_entity.dart';

class DayModel extends DayEntity {
  DayModel({
    required List<HourModel> hourlyWeather,
    required DateTime date,
    required String maxTemp_c,
    required String maxTemp_f,
    required String minTemp_c,
    required String minTemp_f,
    required String avgTemp_c,
    required String avgTemp_f,
    required String avgHumidity,
    required bool isRainy,
    required String chanceOfRain,
    required bool isSnowy,
    required String chanceOfSnow,
    required String condition,
    required String uv,
  }) : super(
          avgHumidity: avgHumidity,
          avgTemp_c: avgTemp_c,
          avgTemp_f: avgTemp_f,
          chanceOfRain: chanceOfRain,
          chanceOfSnow: chanceOfSnow,
          condition: condition,
          date: date,
          hourlyWeather: hourlyWeather,
          isRainy: isRainy,
          isSnowy: isSnowy,
          maxTemp_c: maxTemp_c,
          maxTemp_f: maxTemp_f,
          minTemp_c: minTemp_c,
          minTemp_f: minTemp_f,
          uv: uv,
        );

  factory DayModel.fromJson(data) {
    // logger.i(data);
    final forecast = data;
    // logger.i(forecast);
    final forecastday = forecast;
    // logger.d(forecastday);
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(
        int.parse("${forecastday["date_epoch"]}000"));

    ///int.parse("${data["time_epoch"]}000")
    final day = forecastday["day"];
    final hour = forecastday["hour"];
    // logger.i(hour);

    return DayModel(
      hourlyWeather: hour
          .map<HourModel>(
            (hourData) => HourModel.fromJson(hourData),
          )
          .toList(),
      date: date,
      maxTemp_c: day["maxtemp_c"].toString(),
      maxTemp_f: day["maxtemp_f"].toString(),
      minTemp_c: day["mintemp_c"].toString(),
      minTemp_f: day["mintemp_f"].toString(),
      avgTemp_c: day["avgtemp_c"].toString(),
      avgTemp_f: day["avgtemp_f"].toString(),
      avgHumidity: day["avghumidity"].toString(),
      isRainy: day["daily_will_it_rain"] == "1" ? true : false,
      chanceOfRain: day["daily_chance_of_rain"].toString(),
      isSnowy: day["daily_will_it_snow"] == "1" ? true : false,
      chanceOfSnow: day["daily_chance_of_snow"].toString(),
      condition: day["condition"]["text"],
      uv: day["uv"].toString(),
    );

    ///
  }
}

import 'dart:convert';

import 'package:weather/core/constants/logger.dart';
import 'package:weather/features/weather/data/models/hour_model.dart';
import 'package:weather/features/weather/domain/entities/day_entity.dart';

class DayModel extends DayEntity {
  DayModel({
    required List<HourModel> hourlyWeather,
    required DateTime date,
    required String maxTemp,
    required String minTemp,
    required String avgTemp,
    required String avgHumidity,
    required bool isRainy,
    required String chanceOfRain,
    required bool isSnowy,
    required String chanceOfSnow,
    required String condition,
    required String uv,
  }) : super(
          avgHumidity: avgHumidity,
          avgTemp: avgTemp,
          chanceOfRain: chanceOfRain,
          chanceOfSnow: chanceOfSnow,
          condition: condition,
          date: date,
          hourlyWeather: hourlyWeather,
          isRainy: isRainy,
          isSnowy: isSnowy,
          maxTemp: maxTemp,
          minTemp: minTemp,
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
      maxTemp: day["maxtemp_c"].toString(),
      minTemp: day["mintemp_c"].toString(),
      avgTemp: day["avgtemp_c"].toString(),
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

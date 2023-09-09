// ignore_for_file: non_constant_identifier_names

import 'package:weather/core/constants/logger.dart';
import 'package:weather/features/weather/domain/entities/hour_entity.dart';

class HourModel extends HourEntity {
  HourModel({
    required DateTime time,
    required String temp_c,
    required String temp_f,
    required bool isDay,
    required String condition,
    required String wind_kph,
    required String wind_mph,
    required String humidity,
    required String feelsLike_c,
    required String feelsLike_f,
    required bool isRainy,
    required String chanceOfRain,
    required bool isSnowy,
    required String chanceOfSnow,
    required String uv,
  }) : super(
          chanceOfRain: chanceOfRain,
          temp_c: temp_c,
          temp_f: temp_f,
          time: time,
          chanceOfSnow: chanceOfSnow,
          condition: condition,
          feelsLike_c: feelsLike_c,
          feelsLike_f: feelsLike_f,
          humidity: humidity,
          isDay: isDay,
          isRainy: isRainy,
          isSnowy: isSnowy,
          uv: uv,
          wind_kph: wind_kph,
          wind_mph: wind_mph,
        );

  factory HourModel.fromJson(data) {
    // logger.i(data);
    try {
      final DateTime time = DateTime.fromMillisecondsSinceEpoch(
          int.parse("${data["time_epoch"]}000"));

      return HourModel(
        time: time,
        temp_c: data["temp_c"].toString(),
        temp_f: data["temp_f"].toString(),
        isDay: data["is_day"] == "1" ? true : false,
        condition: data["condition"]["text"],
        wind_kph: data["wind_kph"].toString(),
        wind_mph: data["wind_mph"].toString(),
        humidity: data["humidity"].toString(),
        feelsLike_c: data["feelslike_c"].toString(),
        feelsLike_f: data["feelslike_f"].toString(),
        isRainy: data["will_it_rain"] == "1" ? true : false,
        chanceOfRain: data["chance_of_rain"].toString(),
        isSnowy: data["will_it_snow"] == "1" ? true : false,
        chanceOfSnow: data["chance_of_snow"].toString(),
        uv: data["uv"].toString(),
      );
    } on Exception catch (e) {
      logger.e(e);
      final DateTime time =
          DateTime.fromMillisecondsSinceEpoch(data["time_epoch"]);
      return HourModel(
        time: time,
        temp_c: data["temp_c"].toString(),
        temp_f: data["temp_f"].toString(),
        isDay: data["is_day"] == "1" ? true : false,
        condition: data["condition"]["text"],
        wind_kph: data["wind_kph"].toString(),
        wind_mph: data["wind_mph"].toString(),
        humidity: data["humidity"].toString(),
        feelsLike_c: data["feelslike_c"].toString(),
        feelsLike_f: data["feelslike_f"].toString(),
        isRainy: data["will_it_rain"] == "1" ? true : false,
        chanceOfRain: data["chance_of_rain"].toString(),
        isSnowy: data["will_it_snow"] == "1" ? true : false,
        chanceOfSnow: data["chance_of_snow"].toString(),
        uv: data["uv"].toString(),
      );
    }
  }
}

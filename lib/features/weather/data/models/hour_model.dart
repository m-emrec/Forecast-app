import 'package:weather/core/constants/logger.dart';
import 'package:weather/features/weather/domain/entities/hour_entity.dart';

class HourModel extends HourEntity {
  HourModel({
    required DateTime time,
    required String temp,
    required bool isDay,
    required String condition,
    required String wind,
    required String humidity,
    required String feelsLike,
    required bool isRainy,
    required String chanceOfRain,
    required bool isSnowy,
    required String chanceOfSnow,
    required String uv,
  }) : super(
          chanceOfRain: chanceOfRain,
          temp: temp,
          time: time,
          chanceOfSnow: chanceOfSnow,
          condition: condition,
          feelsLike: feelsLike,
          humidity: humidity,
          isDay: isDay,
          isRainy: isRainy,
          isSnowy: isSnowy,
          uv: uv,
          wind: wind,
        );

  factory HourModel.fromJson(data) {
    // logger.i(data);
    try {
      final DateTime time = DateTime.fromMillisecondsSinceEpoch(
          int.parse("${data["time_epoch"]}000"));

      return HourModel(
        time: time,
        temp: data["temp_c"].toString(),
        isDay: data["is_day"] == "1" ? true : false,
        condition: data["condition"]["text"],
        wind: data["wind_kph"].toString(),
        humidity: data["humidity"].toString(),
        feelsLike: data["feelslike_c"].toString(),
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
        temp: data["temp_c"],
        isDay: data["is_day"],
        condition: data["condition"]["text"],
        wind: data["wind_kph"],
        humidity: data["humidity"],
        feelsLike: data["feelslike_c"],
        isRainy: data["will_it_rain"],
        chanceOfRain: data["chance_of_rain"],
        isSnowy: data["will_it_snow"],
        chanceOfSnow: data["chance_of_snow"],
        uv: data["uv"],
      );
    }
  }
}

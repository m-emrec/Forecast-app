import 'package:weather/features/weather/domain/entities/day_entity.dart';

class DayModel extends DayEntity {
  DayModel(
      {required super.hourlyWeather,
      required super.date,
      required super.maxTemp,
      required super.minTemp,
      required super.avgTemp,
      required super.avgHumidity,
      required super.isRainy,
      required super.chanceOfRain,
      required super.isSnowy,
      required super.chanceOfSnow,
      required super.condition,
      required super.uv});
}

import 'package:weather/features/weather/domain/entities/hour_entity.dart';

class HourModel extends HourEntity {
  HourModel(
      {required super.time,
      required super.temp,
      required super.isDay,
      required super.condition,
      required super.wind,
      required super.humidity,
      required super.feelsLike,
      required super.isRainy,
      required super.chanceOfRain,
      required super.isSnowy,
      required super.chanceOfSnow,
      required super.uv});
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:weather/features/weather/domain/entities/hour_entity.dart';

class DayEntity {
  final List<HourEntity> hourlyWeather;

  final DateTime date;
  final String maxTemp;
  final String minTemp;
  final String avgTemp;
  final String avgHumidity;
  final bool isRainy;
  final String chanceOfRain;
  final bool isSnowy;
  final String chanceOfSnow;
  final String condition;
  final String uv;

  DayEntity({
    required this.hourlyWeather,
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.avgTemp,
    required this.avgHumidity,
    required this.isRainy,
    required this.chanceOfRain,
    required this.isSnowy,
    required this.chanceOfSnow,
    required this.condition,
    required this.uv,
  });

  DayEntity copyWith({
    List<HourEntity>? hourlyWeather,
    DateTime? date,
    String? maxTemp,
    String? minTemp,
    String? avgTemp,
    String? avgHumidity,
    bool? isRainy,
    String? chanceOfRain,
    bool? isSnowy,
    String? chanceOfSnow,
    String? condition,
    String? uv,
  }) {
    return DayEntity(
      hourlyWeather: hourlyWeather ?? this.hourlyWeather,
      date: date ?? this.date,
      maxTemp: maxTemp ?? this.maxTemp,
      minTemp: minTemp ?? this.minTemp,
      avgTemp: avgTemp ?? this.avgTemp,
      avgHumidity: avgHumidity ?? this.avgHumidity,
      isRainy: isRainy ?? this.isRainy,
      chanceOfRain: chanceOfRain ?? this.chanceOfRain,
      isSnowy: isSnowy ?? this.isSnowy,
      chanceOfSnow: chanceOfSnow ?? this.chanceOfSnow,
      condition: condition ?? this.condition,
      uv: uv ?? this.uv,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hourlyWeather': hourlyWeather.map((x) => x.toMap()).toList(),
      'date': date.millisecondsSinceEpoch,
      'maxTemp': maxTemp,
      'minTemp': minTemp,
      'avgTemp': avgTemp,
      'avgHumidity': avgHumidity,
      'isRainy': isRainy,
      'chanceOfRain': chanceOfRain,
      'isSnowy': isSnowy,
      'chanceOfSnow': chanceOfSnow,
      'condition': condition,
      'uv': uv,
    };
  }

  factory DayEntity.fromMap(Map<String, dynamic> map) {
    return DayEntity(
      hourlyWeather: List<HourEntity>.from(
        (map['hourlyWeather'] as List<int>).map<HourEntity>(
          (x) => HourEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      maxTemp: map['maxTemp'] as String,
      minTemp: map['minTemp'] as String,
      avgTemp: map['avgTemp'] as String,
      avgHumidity: map['avgHumidity'] as String,
      isRainy: map['isRainy'] as bool,
      chanceOfRain: map['chanceOfRain'] as String,
      isSnowy: map['isSnowy'] as bool,
      chanceOfSnow: map['chanceOfSnow'] as String,
      condition: map['condition'] as String,
      uv: map['uv'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DayEntity.fromJson(String source) =>
      DayEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
// / / "date": "2023-08-20",
//                 "date_epoch": 1692489600,
// "day": {
//                     "maxtemp_c": 25.4,
//                     "maxtemp_f": 77.7,
//                     "mintemp_c": 15.4,
//                     "mintemp_f": 59.7,
//                     "avgtemp_c": 20.2,
//                     "avgtemp_f": 68.3,
//                     "maxwind_mph": 11.0,
//                     "maxwind_kph": 17.6,
//                     "totalsnow_cm": 0.0,
//                     "avghumidity": 65.0,
//                     "daily_will_it_rain": 0,
//                     "daily_chance_of_rain": 0,
//                     "daily_will_it_snow": 0,
//                     "daily_chance_of_snow": 0,
//                     "condition": {
//                         "text": "Partly cloudy",
//                         "code": 1003
//                     },
//                     "uv": 6.0
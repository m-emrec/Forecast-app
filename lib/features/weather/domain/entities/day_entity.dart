// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:weather/features/weather/domain/entities/hour_entity.dart';

class DayEntity {
  final List<HourEntity> hourlyWeather;

  final DateTime date;
  final String maxTemp_c;
  final String maxTemp_f;
  final String minTemp_c;
  final String minTemp_f;
  final String avgTemp_c;
  final String avgTemp_f;
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
    required this.maxTemp_c,
    required this.maxTemp_f,
    required this.minTemp_c,
    required this.minTemp_f,
    required this.avgTemp_c,
    required this.avgTemp_f,
    required this.avgHumidity,
    required this.isRainy,
    required this.chanceOfRain,
    required this.isSnowy,
    required this.chanceOfSnow,
    required this.condition,
    required this.uv,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hourlyWeather': hourlyWeather.map((x) => x.toMap()).toList(),
      'date': date.millisecondsSinceEpoch,
      'maxTemp_c': maxTemp_c,
      'maxTemp_f': maxTemp_f,
      'minTemp_c': minTemp_c,
      'minTemp_f': minTemp_f,
      'avgTemp_c': avgTemp_c,
      'avgTemp_f': avgTemp_f,
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
      maxTemp_c: map['maxTemp_c'] as String,
      maxTemp_f: map['maxTemp_f'] as String,
      minTemp_c: map['minTemp_c'] as String,
      minTemp_f: map['minTemp_f'] as String,
      avgTemp_c: map['avgTemp_c'] as String,
      avgTemp_f: map['avgTemp_f'] as String,
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
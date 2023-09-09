// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class HourEntity {
  final DateTime time;
  final String temp_c;
  final String temp_f;
  final bool isDay;
  final String condition;
  final String wind_kph;
  final String wind_mph;
  final String humidity;
  final String feelsLike_c;
  final String feelsLike_f;
  final bool isRainy;
  final String chanceOfRain;
  final bool isSnowy;
  final String chanceOfSnow;
  final String uv;
  HourEntity({
    required this.time,
    required this.temp_c,
    required this.temp_f,
    required this.isDay,
    required this.condition,
    required this.wind_kph,
    required this.wind_mph,
    required this.humidity,
    required this.feelsLike_c,
    required this.feelsLike_f,
    required this.isRainy,
    required this.chanceOfRain,
    required this.isSnowy,
    required this.chanceOfSnow,
    required this.uv,
  });

  HourEntity copyWith({
    DateTime? time,
    String? temp,
    bool? isDay,
    String? condition,
    String? wind,
    String? humidity,
    String? feelsLike,
    String? isRainy,
    String? chanceOfRain,
    String? isSnowy,
    String? chanceOfSnow,
    String? uv,
  }) {
    return HourEntity(
      time: time ?? this.time,
      temp_c: temp_c ?? this.temp_c,
      temp_f: temp_f ?? this.temp_f,
      isDay: isDay ?? this.isDay,
      condition: condition ?? this.condition,
      wind_kph: wind_kph ?? this.wind_kph,
      wind_mph: wind_mph ?? this.wind_mph,
      humidity: humidity ?? this.humidity,
      feelsLike_c: feelsLike_c ?? this.feelsLike_c,
      feelsLike_f: feelsLike_f ?? this.feelsLike_f,
      isRainy: isRainy == "1" ? true : false,
      chanceOfRain: chanceOfRain ?? this.chanceOfRain,
      isSnowy: isSnowy == "1" ? true : false,
      chanceOfSnow: chanceOfSnow ?? this.chanceOfSnow,
      uv: uv ?? this.uv,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time.millisecondsSinceEpoch,
      'temp_c': temp_c,
      'temp_f': temp_f,
      'isDay': isDay,
      'condition': condition,
      'wind_kph': wind_kph,
      'wind_mph': wind_mph,
      'humidity': humidity,
      'feelsLike_c': feelsLike_c,
      'feelsLike_f': feelsLike_f,
      'isRainy': isRainy,
      'chanceOfRain': chanceOfRain,
      'isSnowy': isSnowy,
      'chanceOfSnow': chanceOfSnow,
      'uv': uv,
    };
  }

  factory HourEntity.fromMap(Map<String, dynamic> map) {
    return HourEntity(
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
      temp_c: map['temp_c'] as String,
      temp_f: map['temp_f'] as String,
      isDay: map['isDay'] as bool,
      condition: map['condition'] as String,
      wind_kph: map['wind_kph'] as String,
      wind_mph: map['wind_mph'] as String,
      humidity: map['humidity'] as String,
      feelsLike_c: map['feelsLike_c'] as String,
      feelsLike_f: map['feelsLike_f'] as String,
      isRainy: map['isRainy'].toString() == "1" ? true : false,
      chanceOfRain: map['chanceOfRain'] as String,
      isSnowy: map['isSnowy'].toString() == "1" ? true : false,
      chanceOfSnow: map['chanceOfSnow'] as String,
      uv: map['uv'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HourEntity.fromJson(String source) =>
      HourEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}

// "hour": [s
//                     {
//                         "time_epoch": 1692486000,
//                         "time": "2023-08-20 00:00",
//                         "temp_c": 17.0,
//                         "temp_f": 62.6,
//                         "is_day": 0,
//                         "condition": {
//                             "text": "Clear",
//                             "code": 1000
//                         },
//                         "wind_mph": 6.3,
//                         "wind_kph": 10.1,
//                         "wind_degree": 229,
//                         "wind_dir": "SW",
//                         "pressure_mb": 1020.0,
//                         "pressure_in": 30.12,
//                         "humidity": 79,
//                         "cloud": 7,
//                         "feelslike_c": 17.0,
//                         "feelslike_f": 62.6,
//                         "windchill_c": 17.0,
//                         "windchill_f": 62.6,
//                         "heatindex_c": 17.0,
//                         "heatindex_f": 62.6,
//                         "dewpoint_c": 13.2,
//                         "dewpoint_f": 55.8,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "uv": 1.0
//                     },
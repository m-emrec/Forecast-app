import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class HourEntity {
  final DateTime time;
  final String temp;
  final bool isDay;
  final String condition;
  final String wind;
  final String humidity;
  final String feelsLike;
  final String isRainy;
  final String chanceOfRain;
  final String isSnowy;
  final String chanceOfSnow;
  final String uv;
  HourEntity({
    required this.time,
    required this.temp,
    required this.isDay,
    required this.condition,
    required this.wind,
    required this.humidity,
    required this.feelsLike,
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
      temp: temp ?? this.temp,
      isDay: isDay ?? this.isDay,
      condition: condition ?? this.condition,
      wind: wind ?? this.wind,
      humidity: humidity ?? this.humidity,
      feelsLike: feelsLike ?? this.feelsLike,
      isRainy: isRainy ?? this.isRainy,
      chanceOfRain: chanceOfRain ?? this.chanceOfRain,
      isSnowy: isSnowy ?? this.isSnowy,
      chanceOfSnow: chanceOfSnow ?? this.chanceOfSnow,
      uv: uv ?? this.uv,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time.millisecondsSinceEpoch,
      'temp': temp,
      'isDay': isDay,
      'condition': condition,
      'wind': wind,
      'humidity': humidity,
      'feelsLike': feelsLike,
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
      temp: map['temp'] as String,
      isDay: map['isDay'] as bool,
      condition: map['condition'] as String,
      wind: map['wind'] as String,
      humidity: map['humidity'] as String,
      feelsLike: map['feelsLike'] as String,
      isRainy: map['isRainy'] as String,
      chanceOfRain: map['chanceOfRain'] as String,
      isSnowy: map['isSnowy'] as String,
      chanceOfSnow: map['chanceOfSnow'] as String,
      uv: map['uv'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HourEntity.fromJson(String source) =>
      HourEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HourEntity(time: $time, temp: $temp, isDay: $isDay, condition: $condition, wind: $wind, humidity: $humidity, feelsLike: $feelsLike, isRainy: $isRainy, chanceOfRain: $chanceOfRain, isSnowy: $isSnowy, chanceOfSnow: $chanceOfSnow, uv: $uv)';
  }

  @override
  bool operator ==(covariant HourEntity other) {
    if (identical(this, other)) return true;

    return other.time == time &&
        other.temp == temp &&
        other.isDay == isDay &&
        other.condition == condition &&
        other.wind == wind &&
        other.humidity == humidity &&
        other.feelsLike == feelsLike &&
        other.isRainy == isRainy &&
        other.chanceOfRain == chanceOfRain &&
        other.isSnowy == isSnowy &&
        other.chanceOfSnow == chanceOfSnow &&
        other.uv == uv;
  }

  @override
  int get hashCode {
    return time.hashCode ^
        temp.hashCode ^
        isDay.hashCode ^
        condition.hashCode ^
        wind.hashCode ^
        humidity.hashCode ^
        feelsLike.hashCode ^
        isRainy.hashCode ^
        chanceOfRain.hashCode ^
        isSnowy.hashCode ^
        chanceOfSnow.hashCode ^
        uv.hashCode;
  }
}

// "hour": [
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
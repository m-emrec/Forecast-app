// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class CurrentWeatherEntity {
  final DateTime? lastUpdated;
  final String? temp_c;
  final String? temp_f;
  final bool? isDay;
  final String? condition;
  final String? wind_kph;
  final String? wind_mph;
  final String? humidity;
  final String? uv;
  final String? feelsLike_c;
  final String? feelsLike_f;

  final String? locationName;
  final String? country;
  final String? region;

  CurrentWeatherEntity({
    this.lastUpdated,
    this.temp_c,
    this.temp_f,
    this.isDay,
    this.condition,
    this.wind_kph,
    this.wind_mph,
    this.humidity,
    this.uv,
    this.feelsLike_c,
    this.feelsLike_f,
    this.locationName,
    this.country,
    this.region,
  });
}

    // "current": {
    //     "last_updated_epoch": 1692543600,
    //     "last_updated": "2023-08-20 16:00",
    //     "temp_c": 25.0,
    //     "temp_f": 77.0,
    //     "is_day": 1,
    //     "condition": {
    //         "text": "Partly cloudy",
    //         "code": 1003
    //     },
    //     "wind_mph": 9.4,
    //     "wind_kph": 15.1,
    //     "wind_degree": 220,
    //     "wind_dir": "SW",
    //     "humidity": 51,
    //     "cloud": 50,
    //     "feelslike_c": 25.5,
    //     "feelslike_f": 77.9,
    //     "uv": 5.0
    // },
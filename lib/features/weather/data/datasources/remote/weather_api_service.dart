// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'dart:io';

import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/constants/strings.dart';
import 'package:weather/core/resources/http_response.dart';
import 'package:weather/features/weather/data/models/current_weather_model.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';
import 'package:http/http.dart' as http;

import '../../models/day_model.dart';

class WeatherApiService {
  // final String apiKey;

  ///Latitude and Longitude (Decimal degree) e.g: q=48.8567,2.3508
  // final String location;

  /// number of days : days parameter value ranges between 1 and 14. e.g: days=5
  // final String? days;

  /// fetchs the data from the API it returns a [WeatherModel].
  Future<HttpResponseClass<WeatherModel>> fetchCurrentWeatherDataFromApi({
    required String apiKey,
    String? location,
  }) async {
    const String _baseUrl = BASE_API_URL;

    ///
    final String currentWeatherUrl =
        "${_baseUrl}forecast.json?key=$apiKey&q=$location&days=14";

    final response = await http.get(Uri.parse(currentWeatherUrl));

    final json = jsonDecode(response.body);
    final dayList = json["forecast"]["forecastday"];
    // logger.i(dayList);
    final result = WeatherModel(
      currentWeather: CurrentWeatherModel.fromJson(
        json,
      ),
      dayWeather: dayList
          .map<DayModel>(
            (e) => DayModel.fromJson(
              e,
            ),
          )
          .toList(),
    );
    final httpResponse = HttpResponseClass(result, response);
    return httpResponse;
  }
}

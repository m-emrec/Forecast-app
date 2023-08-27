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

  Future<HttpResponseClass<WeatherModel>> fetchCurrentWeatherDataFromApi({
    required String apiKey,
    String? location,
  }) async {
    const String _baseUrl = BASE_API_URL;
// http://api.weatherapi.com/v1/forecast.json?key=ab5247adf474416da98145602232008&q=London&days=1&aqi=no&alerts=no

    final String currentWeatherUrl =
        "${_baseUrl}forecast.json?key=$apiKey&q=$location&days=7";

    final response = await http.get(Uri.parse(currentWeatherUrl));

    // logger.i("------ *Current Weather Json Data* ------\n${response.body}");
    final json = jsonDecode(response.body);
    final dayList = json["forecast"]["forecastday"];
    // logger.i(json["forecast"]["forecastday"].lenght);

    final result = WeatherModel(
        currentWeather: CurrentWeatherModel.fromJson(
          jsonDecode(response.body),
        ),
        dayWeather: dayList
            .map<DayModel>(
              (e) => DayModel.fromJson(
                e,
              ),
            )
            .toList()
        // DayModel.fromJson(
        //   jsonDecode(response.body),
        // ),
        );
    final httpResponse = HttpResponseClass(result, response);
    return httpResponse;
  }

  Future<WeatherModel> fetchForecastWeatherDataFromApi({
    required String apiKey,
    String? location,
    String? days = "7",
  }) async {
    const String _baseUrl = BASE_API_URL;

    final String forecastUrl =
        "${_baseUrl}forecast.json?key=$apiKey&q=$location&days=$days";
    try {
      final response = await http.get(Uri.parse(forecastUrl));
      if (response.statusCode == 200) {
        logger.i(response.body);
      }
    } catch (e) {
      logger.e(e);
    }
    return WeatherModel();
  }
}

// To get 7 day weather for US Zipcode 07112: 
//JSON: http://api.weatherapi.com/v1/forecast.json?key=<YOUR_API_KEY>&q=07112&days=7

// "http://api.weatherapi.com/v1/current.json?key=<YOUR_API_KEY>&q=London";
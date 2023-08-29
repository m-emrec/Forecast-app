import 'package:geolocator/geolocator.dart';
import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherRepo {
  ///
  Future<DataState<WeatherEntity>> getWeatherData(String location);

  Future changeLocation();

  Future<DataState<Position>> getLocation();
}

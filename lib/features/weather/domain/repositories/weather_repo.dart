import 'package:either_dart/either.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/core/resources/data_state.dart';
import 'package:weather/core/resources/location_model.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherRepo {
  ///
  Future<DataState<WeatherEntity>> getWeatherData(String location);

  Future changeLocation();

  Future<DataState<Either<Position, LocationViewModel>>> getLocation();
}

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:either_dart/either.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/constants/strings.dart';
import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/weather/data/datasources/remote/weather_api_service.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';
import 'package:weather/features/weather/domain/repositories/weather_repo.dart';

import '../../../../core/resources/location_model.dart';
import '../../../../injection_container.dart';

class WeatherRepoImpl implements WeatherRepo {
  final WeatherApiService _weatherApiService;

  WeatherRepoImpl(this._weatherApiService);
  @override
  Future changeLocation() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<Either<Position, LocationViewModel>>> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    if (sl<LocationViewModel>().query != null) {
      return DataSuccess<Either<Position, LocationViewModel>>(
        Right<Position, LocationViewModel>(sl<LocationViewModel>()),
      );
    }

    try {
      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        return DataFailed(
            'Location services are disabled.'); // Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return DataFailed(
              'Location permissions are denied'); //Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return DataFailed(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.
      Position _currentPos = await Geolocator.getCurrentPosition();

      return DataSuccess<Either<Position, LocationViewModel>>(
          Left<Position, LocationViewModel>(_currentPos));
    } catch (e) {
      logger.e(e);
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<WeatherModel>> getWeatherData(String location) async {
    try {
      final httpResponse =
          await _weatherApiService.fetchCurrentWeatherDataFromApi(
        apiKey: API_KEY,
        location: location,
      );

      if (httpResponse.response.statusCode == 200) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(httpResponse.response.statusCode);
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}

import 'package:either_dart/either.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/core/resources/location_model.dart';

import '../../../../core/resources/data_state.dart';
import '../repositories/weather_repo.dart';

class GetLocationUseCase {
  final WeatherRepo _weatherRepo;

  GetLocationUseCase(this._weatherRepo);

  Future<DataState<Either<Position, LocationViewModel>>> getLocation() {
    return _weatherRepo.getLocation();
  }
}

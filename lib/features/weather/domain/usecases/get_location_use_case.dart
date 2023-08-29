import 'package:geolocator/geolocator.dart';

import '../../../../core/resources/data_state.dart';
import '../repositories/weather_repo.dart';

class GetLocationUseCase {
  final WeatherRepo _weatherRepo;

  GetLocationUseCase(this._weatherRepo);

  Future<DataState<Position>> getLocation() {
    return _weatherRepo.getLocation();
  }
}

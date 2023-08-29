import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';
import 'package:weather/features/weather/domain/repositories/weather_repo.dart';

class GetWeatherDataUseCase {
  final WeatherRepo _weatherRepo;

  GetWeatherDataUseCase(this._weatherRepo);

  Future<DataState<WeatherEntity>> getWeatherData(String location) {
    return _weatherRepo.getWeatherData(location);
  }
}

import 'package:weather/core/constants/strings.dart';
import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/weather/data/datasources/remote/weather_api_service.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';
import 'package:weather/features/weather/domain/repositories/weather_repo.dart';

class WeatherRepoImpl implements WeatherRepo {
  final WeatherApiService _weatherApiService;

  WeatherRepoImpl(this._weatherApiService);
  @override
  Future changeLocation() {
    // TODO: implement changeLocation
    throw UnimplementedError();
  }

  @override
  Future getLocation() {
    // TODO: implement getLocation
    throw UnimplementedError();
  }

  @override
  Future<DataState<WeatherModel>> getWeatherData() async {
    try {
      final httpResponse =
          await _weatherApiService.fetchCurrentWeatherDataFromApi(
        apiKey: API_KEY,
        location: "Turkey",
      );

      if (httpResponse.response.statusCode == 200) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(httpResponse.response.statusCode.toString());
      }
    } catch (e) {
      return DataFailed(e);
    }
  }
}

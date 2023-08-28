import 'package:get_it/get_it.dart';
import 'package:weather/features/weather/data/datasources/remote/weather_api_service.dart';
import 'package:weather/features/weather/data/repositories/weather_repo_impl.dart';
import 'package:weather/features/weather/domain/repositories/weather_repo.dart';
import 'package:weather/features/weather/domain/usecases/get_weather_data.dart';
import 'package:weather/features/weather/presentation/bloc/weather_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<WeatherApiService>(WeatherApiService());

  sl.registerSingleton<WeatherRepo>(WeatherRepoImpl(sl()));

  sl.registerSingleton<GetWeatherDataUseCase>(GetWeatherDataUseCase(sl()));

  sl.registerSingleton<WeatherBloc>(WeatherBloc(sl()));
}

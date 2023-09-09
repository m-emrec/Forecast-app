import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/resources/location_model.dart';
import 'package:weather/features/search_location/data/repositories/location_repo_impl.dart';
import 'package:weather/features/search_location/domain/repositories/location_repo.dart';
import 'package:weather/features/search_location/domain/usecases/get_predictions_use_case.dart';
import 'package:weather/features/search_location/presentation/bloc/search_location_bloc.dart';
import 'package:weather/features/settings/data/models/settings_model.dart';
import 'package:weather/features/settings/data/repositories/settings_repo_impl.dart';
import 'package:weather/features/settings/domain/entities/settings_entity.dart';
import 'package:weather/features/settings/domain/repositories/settings_repo.dart';
import 'package:weather/features/settings/domain/usecases/change_settings_use_case.dart';
import 'package:weather/features/settings/domain/usecases/get_settings_from_device_use_case.dart';
import 'package:weather/features/settings/domain/usecases/save_settings_use_case.dart';
import 'package:weather/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:weather/features/weather/data/datasources/remote/weather_api_service.dart';
import 'package:weather/features/weather/data/repositories/weather_repo_impl.dart';
import 'package:weather/features/weather/domain/repositories/weather_repo.dart';
import 'package:weather/features/weather/domain/usecases/get_location_use_case.dart';
import 'package:weather/features/weather/domain/usecases/get_weather_data.dart';
import 'package:weather/features/weather/presentation/bloc/weather_bloc.dart';

import 'features/search_location/data/datasources/remote/location_predictions_api_service.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.allowReassignment = true;

  sl.registerSingleton<WeatherApiService>(WeatherApiService());

  sl.registerSingleton<WeatherRepo>(WeatherRepoImpl(sl()));

  sl.registerSingleton<GetWeatherDataUseCase>(GetWeatherDataUseCase(sl()));
  sl.registerSingleton<GetLocationUseCase>(GetLocationUseCase(sl()));

  sl.registerSingleton<WeatherBloc>(WeatherBloc(sl(), sl()));

  sl.registerSingleton<LocationViewModel>(LocationViewModel(null));

  /// Location PRedictons
  /// Location Api Service
  sl.registerSingleton<LocationsApiService>(LocationsApiService());

  /// Location Repo
  sl.registerSingleton<LocationRepo>(
      LocationRepoImpl(sl<LocationsApiService>()));

  /// GetPRedictionsUSeCase
  sl.registerSingleton<GetPredictionsUseCase>(
      GetPredictionsUseCase(sl<LocationRepo>()));

  /// Bloc
  sl.registerSingleton<SearchLocationBloc>(
      SearchLocationBloc(sl<GetPredictionsUseCase>()));

  SharedPreferences prefs = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(prefs);

  // * Settings

  sl.registerSingleton<SettingsRepo>(SettingsRepoImpl());

  sl.registerSingleton<SettingsEntitiy>(
    SettingsEntitiy(
      allowLocation: prefs.getBool("allowLocation") ?? false,
      allowNotification: prefs.getBool("allowNotification") ?? false,
      temperatureUnit: prefs.getString("tempUnit") ?? "celcius",
      windSpeedUnit: prefs.getString("windUnit") ?? "kph",
    ),
  );

  sl.registerSingleton(SaveSettingsUseCase(sl()));
  sl.registerSingleton(GetSettingsFromDeviceUseCase(sl()));
  sl.registerSingleton(ChangeSettingsUseCase(sl()));

  sl.registerSingleton<SettingsBloc>(
    SettingsBloc(
      sl(),
      sl(),
      sl(),
    ),
  );

  sl.registerSingletonAsync<LocationPermission>(
      () async => await Geolocator.checkPermission());
}

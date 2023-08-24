import 'package:get_it/get_it.dart';
import 'package:weather/features/weather/data/datasources/remote/weather_api_service.dart';
import 'package:weather/features/weather/data/repositories/weather_repo_impl.dart';
import 'package:weather/features/weather/domain/repositories/weather_repo.dart';
import 'package:weather/features/weather/domain/usecases/get_weather_data.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  /// register Dio
  // sl.registerSingleton<Dio>(Dio());

  /// register NewsApiService
  // sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  /// register ArticleRepo
  // sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));
  // register @[GetArticleUseCase]
  // sl.registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(sl()));

  /// register Bloc
  // sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));

  sl.registerSingleton<WeatherApiService>(WeatherApiService());

  sl.registerSingleton<WeatherRepo>(WeatherRepoImpl(sl()));

  sl.registerSingleton<GetWeatherDataUseCase>(GetWeatherDataUseCase(sl()));
}

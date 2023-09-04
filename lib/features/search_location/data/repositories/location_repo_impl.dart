import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/constants/strings.dart';
import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/search_location/data/datasources/remote/location_predictions_api_service.dart';
import 'package:weather/features/search_location/data/models/location_model.dart';

import 'package:weather/features/search_location/domain/entities/location_entity.dart';

import '../../domain/repositories/location_repo.dart';

class LocationRepoImpl implements LocationRepo {
  final LocationsApiService _locationsApiService;

  LocationRepoImpl(this._locationsApiService);

  @override
  Future<DataState<LocationModel>> getPredictions(String query) async {
    try {
      final httpRespone = await _locationsApiService.fetchLocationPredictions(
        query: query,
        apiKey: MAPS_API_KEY,
      );
      if (httpRespone.response.statusCode == 200) {
        return DataSuccess(httpRespone.data);
      } else {
        return DataFailed(httpRespone.response.statusCode);
      }
    } catch (e) {
      logger.e(e);
      return DataFailed(e);
    }
  }
}

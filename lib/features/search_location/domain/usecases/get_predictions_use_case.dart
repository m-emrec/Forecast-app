import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/search_location/domain/entities/location_entity.dart';
import 'package:weather/features/search_location/domain/repositories/location_repo.dart';

class GetPredictionsUseCase {
  final LocationRepo _locationRepo;

  GetPredictionsUseCase(this._locationRepo);

  Future<DataState<LocationEntity>> getPredictions(String query) {
    return _locationRepo.getPredictions(query);
  }
}

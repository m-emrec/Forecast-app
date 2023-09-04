import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/search_location/domain/entities/location_entity.dart';

abstract class LocationRepo {
  /// gets the prediction list from the api
  Future<DataState<LocationEntity>> getPredictions(String query);
}

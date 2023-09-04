// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather/features/search_location/domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  LocationModel({
    List? predictions,
  }) : super(predictions: predictions);

  factory LocationModel.fromJson(source) {
    final List predictions = source;
    final List<Map<String, dynamic>> list =
        predictions.map<Map<String, dynamic>>((e) => e["description"]).toList();
    return LocationModel(predictions: list);
  }
}

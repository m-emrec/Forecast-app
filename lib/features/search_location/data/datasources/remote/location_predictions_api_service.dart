import 'dart:convert';

import 'package:weather/features/search_location/data/models/location_model.dart';
import 'package:http/http.dart' as http;
import '../../../../../core/constants/logger.dart';
import '../../../../../core/resources/http_response.dart';

class LocationsApiService {
  Future<HttpResponseClass<LocationModel>> fetchLocationPredictions({
    required String apiKey,
    String? query,
  }) async {
    Uri uri = Uri.https(
      "maps.googleapis.com",
      "maps/api/place/autocomplete/json",
      {
        "input": query,
        "key": apiKey,
      },
    );
    final response = await http.get(uri);
    // logger.i(uri);
    final json = jsonDecode(response.body);
    final result = LocationModel(predictions: json["predictions"]);
    //["predictions"][0]["types"][2]
    // logger.i(json);
    final httpResponse = HttpResponseClass(result, response);
    return httpResponse;
  }
}

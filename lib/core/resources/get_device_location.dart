// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:geolocator/geolocator.dart';
import 'package:weather/core/resources/data_state.dart';

class GetDeviceLocation {
  Future<DataState<Position>> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    try {
      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        return DataFailed(
            'Location services are disabled.'); // Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return DataFailed(
              'Location permissions are denied'); //Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return DataFailed(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.
      Position _currentPos = await Geolocator.getCurrentPosition();
      return DataSuccess(_currentPos);
    } catch (e) {
      return DataFailed(e);
    }
  }
}

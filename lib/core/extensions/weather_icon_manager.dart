import '../constants/logger.dart';

extension WeatherIconManager on String {
  String get getIcon {
    String condition = this;

    if (contains("rain")) {
      condition = "Rainy";
    }
    if (contains("snow")) {
      condition = "Snowy";
    }
    if (contains("thunder")) {
      condition = "Stormy";
    }
    if (contains("cloud") || contains("Overcast")) {
      condition = "Cloudy";
    }

    switch (condition) {
      case "Sunny" || "Clear":
        return "sun";
      case "Cloudy":
        return "clouds";
      case "Rainy":
        return "rain";
      case "Snowy":
        return "snow";
      case "Stormy":
        return "storm";

      default:
        logger.i(condition);
        return "sun";
    }
  }
}

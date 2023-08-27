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
        return "Sunny";
    }
  }
}

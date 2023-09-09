import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/empty_padding.dart';
import 'package:weather/core/extensions/image_extension.dart';

import '../../domain/entities/weather_entity.dart';

class ExpandedInfoSection extends StatefulWidget {
  const ExpandedInfoSection({
    super.key,
  });

  @override
  State<ExpandedInfoSection> createState() => _ExpandedInfoSectionState();
}

class _ExpandedInfoSectionState extends State<ExpandedInfoSection> {
  late GetIt sl;
  late WeatherEntity _data;
  late SharedPreferences _prefs;

  @override
  void initState() {
    sl = GetIt.instance;
    _data = sl<WeatherEntity>();
    _prefs = sl<SharedPreferences>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Wind
          SizedBox(
            width: width * 0.3,
            child: Column(
              children: [
                Image.asset("wind-icon".toPng),
                Text(
                  _prefs.getString("windUnit") == "kph"
                      ? "${_data.currentWeather!.wind_kph!} km/H"
                      : "${_data.currentWeather!.wind_mph!} m/H",
                  style: context.textTheme.labelMedium,
                ),
                Text(
                  "Wind",
                  style: context.textTheme.labelSmall,
                ),
              ],
            ),
          ),

          /// Humidity
          SizedBox(
            width: width * 0.3,
            child: Column(
              children: [
                Image.asset("humidity".toPng),
                Text(
                  "%${_data.currentWeather!.humidity!}",
                  style: context.textTheme.labelMedium,
                ),
                Text(
                  "Humidity",
                  style: context.textTheme.labelSmall,
                ),
              ],
            ),
          ),

          /// Chance of Rain
          SizedBox(
            width: width * 0.3,
            child: Column(
              children: [
                Image.asset(
                  "chance-of-rain".toPng,
                  height: 24,
                  width: 24,
                ),
                Text(
                  "%${_data.dayWeather?.first.chanceOfRain ?? "?"}",
                  style: context.textTheme.labelMedium,
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Chance of Rain",
                    style: context.textTheme.labelSmall,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
          ),
          4.pw,
        ],
      ),
    );
  }
}

class CollapsedInfoSection extends StatefulWidget {
  const CollapsedInfoSection({
    super.key,
  });

  @override
  State<CollapsedInfoSection> createState() => _CollapsedInfoSectionState();
}

class _CollapsedInfoSectionState extends State<CollapsedInfoSection> {
  late GetIt sl;
  late WeatherEntity _data;
  late SharedPreferences _prefs;
  @override
  void initState() {
    sl = GetIt.instance;
    _data = sl<WeatherEntity>();
    _prefs = sl<SharedPreferences>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Wind

          SizedBox(
            width: width * 0.3,
            child: Column(
              children: [
                Image.asset("wind-icon".toPng),
                Text(
                  _prefs.getString("windUnit") == "kph"
                      ? "${_data.currentWeather!.wind_kph!} km/H"
                      : "${_data.currentWeather!.wind_mph!} m/H",
                  style: context.textTheme.labelMedium,
                ),
                Text(
                  "Wind",
                  style: context.textTheme.labelSmall,
                ),
              ],
            ),
          ),

          /// Humidity
          SizedBox(
            width: width * 0.3,
            child: Column(
              children: [
                Image.asset("humidity".toPng),
                Text(
                  "%${_data.dayWeather![1].avgHumidity}",
                  style: context.textTheme.labelMedium,
                ),
                Text(
                  "Humidity",
                  style: context.textTheme.labelSmall,
                ),
              ],
            ),
          ),

          /// Chance of Rain
          SizedBox(
            width: width * 0.3,
            child: Column(
              children: [
                Image.asset(
                  "chance-of-rain".toPng,
                  height: 24,
                  width: 24,
                ),
                Text(
                  "%${_data.dayWeather?[1].chanceOfRain ?? "?"}",
                  style: context.textTheme.labelMedium,
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Chance of Rain",
                    style: context.textTheme.labelSmall,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

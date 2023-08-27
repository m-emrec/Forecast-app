import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/image_extension.dart';

import '../../domain/entities/weather_entity.dart';

class InfoSection extends StatefulWidget {
  const InfoSection({
    super.key,
  });

  @override
  State<InfoSection> createState() => _InfoSectionState();
}

class _InfoSectionState extends State<InfoSection> {
  late GetIt sl;
  late WeatherEntity _data;
  @override
  void initState() {
    sl = GetIt.instance;
    _data = sl<WeatherEntity>();
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
                  "${_data.currentWeather!.wind!} km/H",
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
                  _data.dayWeather!.first?.chanceOfRain ?? "?",
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
  @override
  void initState() {
    sl = GetIt.instance;
    _data = sl<WeatherEntity>();
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
                  "${_data.currentWeather!.wind!} km/H",
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
                  _data.dayWeather?[1].chanceOfRain ?? "?",
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

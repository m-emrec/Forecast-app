import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/empty_padding.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';

class TitleSectionExpanded extends StatefulWidget {
  const TitleSectionExpanded({super.key});

  @override
  State<TitleSectionExpanded> createState() => _TitleSectionExpandedState();
}

class _TitleSectionExpandedState extends State<TitleSectionExpanded> {
  late GetIt sl;
  late WeatherEntity _data;
  late SharedPreferences _prefs;
  late bool isCelcius;
  @override
  void initState() {
    sl = GetIt.instance;
    _data = sl<WeatherEntity>();
    _prefs = sl<SharedPreferences>();
    isCelcius = _prefs.getString("tempUnit") == "Celcius";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text.rich(
          TextSpan(
            /// degree
            text: isCelcius
                ? _data.currentWeather!.temp_c!
                : _data.currentWeather!.temp_f!,
            style: context.textTheme.bodyLarge,
            children: [
              /// ℃ symbole
              TextSpan(
                text: isCelcius ? "℃" : "°F",
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),

        /// Weather Condition
        Text(
          _data.currentWeather!.condition!,
          style: context.textTheme.bodyMedium,
        ),

        /// some spacing
        16.ph,

        /// Last updated date
        Text(
          "${DateFormat.MMMEd().format(_data.currentWeather!.lastUpdated!)} - ${DateFormat.Hm().format(_data.currentWeather!.lastUpdated!)}",
          style: context.textTheme.bodySmall,
        ),
      ],
    );
  }
}

/////

class TitleSectionCollapsed extends StatefulWidget {
  const TitleSectionCollapsed({super.key});

  @override
  State<TitleSectionCollapsed> createState() => _TitleSectionCollapsedState();
}

class _TitleSectionCollapsedState extends State<TitleSectionCollapsed> {
  late GetIt sl;
  late WeatherEntity _data;
  late SharedPreferences _prefs;
  late bool isCelcius;
  @override
  void initState() {
    sl = GetIt.instance;
    _data = sl<WeatherEntity>();
    _prefs = sl<SharedPreferences>();
    isCelcius = _prefs.getString("tempUnit") == "Celcius";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Tomorrow",
          style: context.textTheme.bodyMedium,
        ),
        Text.rich(
          /// Tomorrows temp
          TextSpan(
            text: isCelcius
                ? _data.dayWeather![1].avgTemp_c
                : _data.dayWeather![1].avgTemp_f,
            style: context.textTheme.bodyLarge,
            children: [
              TextSpan(
                text: isCelcius ? "℃" : "°F",
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),

        /// tomorrows weather condition
        Text(
          _data.dayWeather![1].condition,
          style: context.textTheme.bodySmall,
        ),

        /// some spacing
        16.ph,
      ],
    );
  }
}

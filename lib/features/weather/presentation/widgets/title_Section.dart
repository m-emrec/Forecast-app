import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
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
  @override
  void initState() {
    sl = GetIt.instance;
    _data = sl<WeatherEntity>();
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
            text: _data.currentWeather!.temp!,
            style: context.textTheme.bodyLarge,
            children: const [
              /// ℃ symbole
              TextSpan(
                text: "℃",
                style: TextStyle(fontSize: 24),
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
  @override
  void initState() {
    sl = GetIt.instance;
    _data = sl<WeatherEntity>();
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
            text: _data.dayWeather![1].avgTemp,
            style: context.textTheme.bodyLarge,
            children: const [
              TextSpan(
                text: "℃",
                style: TextStyle(fontSize: 24),
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

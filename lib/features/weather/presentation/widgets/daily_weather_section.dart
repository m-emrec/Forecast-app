import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/empty_padding.dart';
import 'package:weather/core/extensions/image_extension.dart';
import 'package:weather/core/extensions/weather_icon_manager.dart';

import '../../domain/entities/weather_entity.dart';

class DailyWeatherSection extends StatefulWidget {
  const DailyWeatherSection({super.key});

  @override
  State<DailyWeatherSection> createState() => _DailyWeatherSectionState();
}

class _DailyWeatherSectionState extends State<DailyWeatherSection> {
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: _data.dayWeather!.length - 2,
        itemBuilder: (BuildContext context, int index) {
          final day = _data.dayWeather![index + 2];
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              /// Day
              leading: Text(
                DateFormat.E().format(day.date),
                style: context.textTheme.bodySmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),

              /// Coondition
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    height: 32,
                    width: 32,
                    image: AssetImage(day.condition.getIcon.toPngDayIcon),
                  ),
                  4.pw,
                  Text(
                    day.condition,
                    style: context.textTheme.labelSmall,
                  ),
                ],
              ),

              /// Deggree
              trailing: Text(
                "${day.avgTemp}°",
                style: context.textTheme.labelMedium,
              ),
            ),
          );
        },
      ),
    );
  }
}

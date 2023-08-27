// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/empty_padding.dart';
import 'package:weather/core/extensions/image_extension.dart';
import 'package:weather/core/extensions/weather_icon_manager.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';
import 'package:weather/features/weather/presentation/bloc/weather_bloc.dart';

class HourlyWeatherSection extends StatefulWidget {
  const HourlyWeatherSection({super.key});

  @override
  State<HourlyWeatherSection> createState() => _HourlyWeatherSectionState();
}

class _HourlyWeatherSectionState extends State<HourlyWeatherSection> {
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
      children: [
        /// Today  7 days button
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today",
                style: context.textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "7 days >",
                  style: context.textTheme.bodySmall!.copyWith(
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: _data.dayWeather!.first.hourlyWeather.length,
            itemBuilder: (BuildContext context, int index) {
              final hourlyWeather =
                  _data.dayWeather!.first.hourlyWeather[index];
              final bool _isCurrentTime =
                  hourlyWeather.time.hour == DateTime.now().hour;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: _isCurrentTime ? null : Colors.transparent,
                      border: Border.all(
                        width: 1,
                        color: const Color(0xFFDBEAFD),
                      ),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF11B5FD),
                          Color(0xFF0F68F4),
                        ],
                      ),
                      boxShadow: _isCurrentTime
                          ? [
                              BoxShadow(
                                color: const Color(0xFF73B2EF).withOpacity(0.5),
                                offset: const Offset(0, 2),
                                spreadRadius: 4,
                                blurRadius: 8,
                                // blurStyle: BlurStyle.outer,
                              ),
                            ]
                          : null,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        /// Deggree
                        Text(
                          "${hourlyWeather.temp}°",
                          style: context.textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            shadows: _isCurrentTime
                                ? [
                                    const BoxShadow(
                                      offset: Offset(0, 2),
                                      blurRadius: 12,
                                    ),
                                  ]
                                : null,
                          ),
                        ),

                        /// Weather Icon
                        Image(
                          height: 24,
                          width: 24,
                          image: AssetImage(
                            hourlyWeather.condition.getIcon.toPngDayIcon,
                          ),
                        ),

                        /// Hour
                        Text(
                          DateFormat.Hm().format(hourlyWeather.time).toString(),
                          style: context.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(
          height: 1000,
        ),
      ],
    );
  }
}

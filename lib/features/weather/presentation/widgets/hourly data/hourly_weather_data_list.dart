// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/image_extension.dart';
import 'package:weather/core/extensions/weather_icon_manager.dart';

import '../../domain/entities/weather_entity.dart';

class HourlyWeatherDataList extends StatefulWidget {
  final WeatherEntity data;
  const HourlyWeatherDataList({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<HourlyWeatherDataList> createState() => _HourlyWeatherDataListState();
}

class _HourlyWeatherDataListState extends State<HourlyWeatherDataList> {
  late WeatherEntity _data;
  @override
  void initState() {
    _data = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.12,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: _data.dayWeather?.first.hourlyWeather.length ?? 24,
        itemBuilder: (BuildContext context, int index) {
          final hourlyWeather = _data.dayWeather!.first.hourlyWeather[index];
          final bool _isCurrentTime =
              hourlyWeather.time.hour == DateTime.now().hour;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: AspectRatio(
              aspectRatio: 2 / 3,
              child: Container(
                clipBehavior: Clip.none,
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
                            offset: const Offset(0, 0),
                            spreadRadius: 1,
                            blurRadius: 8,
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
    );
  }
}

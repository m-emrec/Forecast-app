// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/image_extension.dart';
import 'package:weather/core/extensions/weather_icon_manager.dart';
import 'package:weather/features/weather/domain/entities/hour_entity.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';

class HourlyWeatherItem extends StatefulWidget {
  final bool isCurrentTime;
  final bool isCelcius;
  final HourEntity hourlyWeather;
  final WeatherEntity data;
  const HourlyWeatherItem({
    Key? key,
    required this.isCurrentTime,
    required this.isCelcius,
    required this.hourlyWeather,
    required this.data,
  }) : super(key: key);

  @override
  State<HourlyWeatherItem> createState() => _HourlyWeatherItemState();
}

class _HourlyWeatherItemState extends State<HourlyWeatherItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        color: widget.isCurrentTime ? null : Colors.transparent,
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
        boxShadow: widget.isCurrentTime
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
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            /// Deggree
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                widget.isCelcius
                    ? "${widget.hourlyWeather.temp_c}°"
                    : "${widget.hourlyWeather.temp_f}℉",
                style: context.textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  shadows: widget.isCurrentTime
                      ? [
                          const BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 12,
                          ),
                        ]
                      : null,
                ),
              ),
            ),

            /// Weather Icon
            Image(
              height: 24,
              width: 24,
              image: AssetImage(
                widget.data.currentWeather!.isDay!
                    ? widget
                        .data.currentWeather!.condition!.getIcon.toPngDayIcon
                    : widget
                        .data.currentWeather!.condition!.getIcon.toPngNightIcon,
              ),
            ),

            /// Hour
            Text(
              DateFormat.Hm().format(widget.hourlyWeather.time).toString(),
              style: context.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/empty_padding.dart';
import 'package:weather/core/extensions/image_extension.dart';
import 'package:weather/core/extensions/weather_icon_manager.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';

import 'hourly_weather_data_list.dart';

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
        /// Today  14 days button
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
              Row(
                children: [
                  Icon(
                    Icons.keyboard_double_arrow_up_outlined,
                    color: context.textTheme.bodySmall!.color,
                    size: 14,
                  ),
                  Text(
                    "14 days",
                    style: context.textTheme.bodySmall!.copyWith(
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        /// Hourly List
        HourlyWeatherDataList(data: _data),

        /// Spacing to be able to scroll
        const SizedBox(
          height: 1000,
        ),
      ],
    );
  }
}

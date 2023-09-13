// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/image_extension.dart';
import 'package:weather/core/extensions/weather_icon_manager.dart';

import '../../../../../injection_container.dart';
import '../../../domain/entities/weather_entity.dart';

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
  late SharedPreferences _prefs;
  final ScrollController _scrollController = ScrollController();
  late int _currentTimeIndex;
  late bool _isCelcius;
  bool _scrollManipulated = false;
  @override
  void initState() {
    _prefs = sl<SharedPreferences>();
    _data = widget.data;

    _currentTimeIndex = _findCurrentTimeIndex() ?? 0;

    _isCelcius = _prefs.getString("tempUnit") != null
        ? _prefs.getString("tempUnit") == "Celcius"
        : true;
    super.initState();
  }

  _findCurrentTimeIndex() {
    final int _index = _data.dayWeather!.first.hourlyWeather
        .indexWhere((element) => element.time.hour == DateTime.now().hour);

    return _index;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.12,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        controller: _scrollController,
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
              child: LayoutBuilder(builder: (context, constraints) {
                if (!_scrollManipulated && _currentTimeIndex != 0) {
                  _scrollController.animateTo(
                      _currentTimeIndex / 5 * constraints.maxWidth * 5,
                      duration: Duration(milliseconds: 750),
                      curve: Curves.easeIn);
                  _scrollManipulated = true;
                }

                return Container(
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
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          _isCelcius
                              ? "${hourlyWeather.temp_c}°"
                              : "${hourlyWeather.temp_f}℉",
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
                      ),

                      /// Weather Icon
                      Image(
                        height: 24,
                        width: 24,
                        image: AssetImage(
                          _data.currentWeather!.isDay!
                              ? _data.currentWeather!.condition!.getIcon
                                  .toPngDayIcon
                              : _data.currentWeather!.condition!.getIcon
                                  .toPngNightIcon,
                        ),
                      ),

                      /// Hour
                      Text(
                        DateFormat.Hm().format(hourlyWeather.time).toString(),
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}

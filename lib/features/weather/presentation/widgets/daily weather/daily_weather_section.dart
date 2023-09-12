import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/empty_padding.dart';
import 'package:weather/core/extensions/image_extension.dart';
import 'package:weather/core/extensions/weather_icon_manager.dart';
import 'package:weather/features/weather/presentation/bloc/weather_bloc.dart';

import '../../../domain/entities/weather_entity.dart';

class DailyWeatherSection extends StatefulWidget {
  const DailyWeatherSection({super.key});

  @override
  State<DailyWeatherSection> createState() => _DailyWeatherSectionState();
}

class _DailyWeatherSectionState extends State<DailyWeatherSection> {
  late GetIt sl;
  late WeatherEntity _data;
  late SharedPreferences _prefs;
  final ScrollController _scrollController = ScrollController();
  late bool _isCelcius;
  @override
  void dispose() {
    _scrollController.removeListener(() {});
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    sl = GetIt.instance;
    _data = sl<WeatherEntity>();
    _prefs = sl<SharedPreferences>();
    _isCelcius = _prefs.getString("tempUnit") != null
        ? _prefs.getString("tempUnit") == "Celcius"
        : true;
    _viewManager();
    super.initState();
  }

  _viewManager() {
    _scrollController.addListener(() {
      final pos = _scrollController.position.pixels;
      if (pos < -100) {
        sl<WeatherBloc>().add(ExpandedViewEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: ListView.builder(
          controller: _scrollController,
          shrinkWrap: true,
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

                /// Condition
                title: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
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
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                /// Deggree
                trailing: Text(
                  _isCelcius ? "${day.avgTemp_c}°" : "${day.avgTemp_f}°F",
                  style: context.textTheme.labelMedium,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

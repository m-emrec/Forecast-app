import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/core/constants/logger.dart';
import 'package:weather/features/weather/presentation/widgets/daily_weather_section.dart';
import 'package:weather/features/weather/presentation/widgets/hourly_weather_section.dart';
import 'package:weather/injection_container.dart';

import '../bloc/weather_bloc.dart';

class WeatherDataViewManager extends StatefulWidget {
  const WeatherDataViewManager({super.key});

  @override
  State<WeatherDataViewManager> createState() => _WeatherDataViewManagerState();
}

class _WeatherDataViewManagerState extends State<WeatherDataViewManager> {
  bool _isExpanded = true;
  late WeatherBloc _weatherBloc;
  @override
  void initState() {
    final sl = GetIt.instance;
    _weatherBloc = sl<WeatherBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherBloc, WeatherState>(
      bloc: sl<WeatherBloc>(),
      listener: (context, state) {
        logger.i(
          state,
        );
        if (state is ExpandedViewState) {
          setState(() {
            _isExpanded = true;
          });
        }
        if (state is CollapsedViewState) {
          setState(() {
            _isExpanded = false;
          });
        }
      },
      listenWhen: (previous, current) => current is WeatherActionState,
      buildWhen: (previous, current) => current is WeatherActionState,
      builder: (context, state) {
        logger.d(state);
        return AnimatedCrossFade(
          firstChild: const HourlyWeatherSection(),
          secondChild: const DailyWeatherSection(),
          crossFadeState: _isExpanded
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 400),
        );
      },
    );
  }
}

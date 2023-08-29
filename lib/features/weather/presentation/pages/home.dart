import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/core/constants/logger.dart';
import 'package:weather/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/pages/loading_data.dart';
import 'package:weather/features/weather/presentation/widgets/error_alert_box.dart';

import 'loaded_succes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final sl = GetIt.instance;

  @override
  void initState() {
    sl<WeatherBloc>().add(WeatherFetchDataEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherBloc, WeatherState>(
      bloc: sl<WeatherBloc>(),
      listener: (context, state) {},
      buildWhen: (previous, current) => current is! WeatherActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          /// show LoadingData page
          case WeatherLoadingState:
            return const LoadingData();

          /// Show LoadedData
          case WeatherLoadedSuccessState:
            return const LoadedDataView();

          case WeatherLoadedFailState:
            final execeptionState = state as WeatherLoadedFailState;
            logger.e(execeptionState.error);
            return Scaffold(
              body: ErrorAlert(
                error: execeptionState.error,
              ),
            );

          default:
            return const Scaffold(
              body: SizedBox(),
            );
        }
      },
    );
  }
}

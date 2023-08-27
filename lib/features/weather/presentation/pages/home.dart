import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/empty_padding.dart';
import 'package:weather/core/extensions/image_extension.dart';
import 'package:weather/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/pages/loading_data.dart';
import 'package:weather/features/weather/presentation/widgets/hourly_weather_section.dart';
import 'package:weather/features/weather/presentation/widgets/weather_data_view_manager.dart';

import '../widgets/sliver_app_bar.dart';
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
          case WeatherLoadingState:
            return const LoadingData();
          case WeatherLoadedSuccessState:
            return const LoadedDataView();
          //TODO: case ErrorState
          default:
            return const Scaffold(
              body: SizedBox(),
            );
        }
      },
    );
  }
}

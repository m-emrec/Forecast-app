// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/extensions/empty_padding.dart';
import 'package:weather/features/weather/presentation/bloc/weather_bloc.dart';

import '../widgets/sliver_app_bar.dart';
import '../widgets/view managers/weather_data_view_manager.dart';

class LoadedDataView extends StatefulWidget {
  const LoadedDataView({super.key});

  @override
  State<LoadedDataView> createState() => _LoadedDataViewState();
}

class _LoadedDataViewState extends State<LoadedDataView> {
  late GetIt sl;
  late WeatherBloc _weatherBloc;
  @override
  void initState() {
    sl = GetIt.instance;
    _weatherBloc = sl<WeatherBloc>();
    super.initState();
  }

  void viewManagerFunc(DragEndDetails details) {
    final double _velocity = details.velocity.pixelsPerSecond.dy;

    /// Drag Up [CollapsedView]
    if (_velocity.sign < 0) {
      _weatherBloc.add(CollapsedViewEvent());
    }

    /// Drag Down [ExpandedView]
    if (_velocity.sign > 0) {
      _weatherBloc.add(ExpandedViewEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: GestureDetector(
            onVerticalDragEnd: (details) => viewManagerFunc(details),
            child: const Column(
              children: [
                ///
                CustomAppBar(),

                ///
                WeatherDataViewManager(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

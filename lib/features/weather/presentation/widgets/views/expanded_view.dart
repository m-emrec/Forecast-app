import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/empty_padding.dart';
import 'package:weather/core/extensions/image_extension.dart';
import 'package:weather/core/extensions/weather_icon_manager.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';
import 'package:weather/features/weather/presentation/widgets/title_Section.dart';

import '../../bloc/weather_bloc.dart';
import '../info_section.dart';

class ExpandedView extends StatefulWidget {
  const ExpandedView({super.key});

  @override
  State<ExpandedView> createState() => _ExpandedViewState();
}

class _ExpandedViewState extends State<ExpandedView> {
  late GetIt sl;
  late WeatherBloc _weatherBloc;
  late WeatherEntity _data;
  @override
  void initState() {
    sl = GetIt.instance;
    _data = sl<WeatherEntity>();
    _weatherBloc = sl<WeatherBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => BlocBuilder<WeatherBloc, WeatherState>(
        bloc: _weatherBloc,
        builder: (context, state) {
          return SizedBox(
            height: constraints.maxHeight == double.infinity
                ? null
                : constraints.maxHeight,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppBar(
                    forceMaterialTransparency: true,
                    centerTitle: true,

                    /// Locations button
                    leading: GestureDetector(
                      child: Image.asset("menu-button".toPng),
                    ),

                    /// Title
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.location_on_outlined),
                        8.pw,
                        Text(
                          _data.currentWeather!.locationName!,
                          style: context.textTheme.titleLarge,
                        ),
                      ],
                    ),

                    /// Settings button
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          child: const Icon(Icons.settings_outlined),
                        ),
                      ),
                    ],
                  ),

                  /// Some spacing
                  16.ph,

                  /// Weather Image
                  Image(
                    height: 240,
                    width: 240,
                    image: AssetImage(
                      _data.currentWeather!.condition!.getIcon.toPngDayIcon,
                    ),
                  ),

                  /// Title Section
                  const TitleSectionExpanded(),
                  16.ph,
                  const Divider(),

                  /// More Info Section
                  const ExpandedInfoSection(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

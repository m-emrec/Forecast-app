// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/empty_padding.dart';
import 'package:weather/core/extensions/image_extension.dart';
import 'package:weather/core/extensions/weather_icon_manager.dart';
import 'package:weather/features/search_location/presentation/pages/search_location_page.dart';
import 'package:weather/features/settings/presentation/pages/settings_page.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';
import 'package:weather/features/weather/presentation/widgets/location_selector_popup.dart';
import 'package:weather/features/weather/presentation/widgets/title_Section.dart';
import 'package:http/http.dart' as http;

import '../../bloc/weather_bloc.dart';
import '../info_section.dart';

class ExpandedView extends StatefulWidget {
  const ExpandedView({super.key, required this.expandedHeight});
  final double expandedHeight;
  @override
  State<ExpandedView> createState() => _ExpandedViewState();
}

class _ExpandedViewState extends State<ExpandedView> {
  late GetIt sl;
  late WeatherBloc _weatherBloc;
  late WeatherEntity _data;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  void initState() {
    sl = GetIt.instance;
    _data = sl<WeatherEntity>();
    _weatherBloc = sl<WeatherBloc>();
    _viewManager();
    super.initState();
  }

  _viewManager() {
    _scrollController.addListener(
      () {
        final pos = _scrollController.position.pixels;
        if (pos > 25) {
          // logger.i("Collapsed");
          _weatherBloc.add(CollapsedViewEvent());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: _weatherBloc,
      builder: (context, state) {
        final double height = widget.expandedHeight;
        final double width = MediaQuery.of(context).size.width;

        return SizedBox(
          height: height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              /// AppBar
              AppBar(
                forceMaterialTransparency: true,
                centerTitle: true,

                /// Locations button
                leading: GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const SearchLocationPage(),
                    ),
                  ),
                  child: Image.asset("menu-button".toPng),
                ),

                /// Title
                title: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
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
                ),

                /// Settings button
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context)
                          .push(
                        MaterialPageRoute(
                          builder: (_) => const SettingsPage(),
                        ),
                      )
                          .then((value) {
                        _weatherBloc.add(WeatherFetchDataEvent());
                      }),
                      child: const Icon(Icons.settings_outlined),
                    ),
                  ),
                ],
              ),

              RefreshIndicator.adaptive(
                onRefresh: () {
                  return Future.delayed(
                    const Duration(milliseconds: 500),
                    () => _weatherBloc.add(WeatherFetchDataEvent()),
                  );
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  controller: _scrollController,
                  child: Column(
                    children: [
                      /// Weather Image
                      Image(
                        height: height * 0.35,
                        width: width * 0.5,
                        image: AssetImage(
                          _data.currentWeather!.isDay!
                              ? _data.currentWeather!.condition!.getIcon
                                  .toPngDayIcon
                              : _data.currentWeather!.condition!.getIcon
                                  .toPngNightIcon,
                        ),
                      ),

                      /// Title Section
                      const TitleSectionExpanded(),
                      (height * 0.02).ph,
                      const Divider(),

                      /// More Info Section
                      const ExpandedInfoSection(),
                      // 32.ph,
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

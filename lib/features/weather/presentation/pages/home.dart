import 'package:flutter/material.dart';
import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/empty_padding.dart';
import 'package:weather/core/extensions/image_extension.dart';
import 'package:weather/features/weather/presentation/widgets/hourly_weather_section.dart';
import 'package:weather/features/weather/presentation/widgets/weather_data_view_manager.dart';

import '../widgets/sliver_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 2000,
        child: CustomScrollView(
          controller: _controller,
          slivers: [
            CustomAppBar(
              scrollController: _controller,
            ),

            const SliverToBoxAdapter(
              child: WeatherDataViewManager(),
            ),

            /// Padding
            SliverToBoxAdapter(
              child: (MediaQuery.of(context).size.height * 0.5).ph,
            )
          ],
        ),
      ),
    );
  }
}

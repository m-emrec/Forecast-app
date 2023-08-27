import 'package:flutter/material.dart';
import 'package:weather/core/extensions/empty_padding.dart';

import '../widgets/sliver_app_bar.dart';
import '../widgets/weather_data_view_manager.dart';

class LoadedDataView extends StatefulWidget {
  const LoadedDataView({super.key});

  @override
  State<LoadedDataView> createState() => _LoadedDataViewState();
}

class _LoadedDataViewState extends State<LoadedDataView> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: CustomScrollView(
          controller: _controller,
          slivers: [
            CustomAppBar(
              scrollController: _controller,
            ),

            const SliverToBoxAdapter(
              child: WeatherDataViewManager(),
            ),

            // /// Padding
            // SliverToBoxAdapter(
            //   child: (MediaQuery.of(context).size.height * 0.5).ph,
            // )
          ],
        ),
      ),
    );
  }
}

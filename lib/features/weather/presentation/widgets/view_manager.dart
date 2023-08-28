import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/widgets/views/collapsed_view.dart';
import 'package:weather/features/weather/presentation/widgets/views/expanded_view.dart';

class ViewManager extends StatefulWidget {
  /// Manages the view . In default it returns [ExpandedView] if user scrolls the
  /// screen it returns [CollapsedView] and changes the state.
  const ViewManager({
    Key? key,
    required this.scrollController,
  }) : super(key: key);
  final ScrollController scrollController;

  @override
  State<ViewManager> createState() => _ViewManagerState();
}

class _ViewManagerState extends State<ViewManager>
    with SingleTickerProviderStateMixin {
  ///
  late bool _isExpanded;
  late double height;
  late double expandedHeight;
  late double collapsedHeight;
  final sl = GetIt.instance;
  late WeatherBloc _weatherBloc;

  void _scrollManager(ScrollController controller) {
    controller.addListener(
      () {
        final double position = controller.position.pixels;

        ///
        if (collapsedHeight - position < expandedHeight * 0.5) {
          setState(() {
            _isExpanded = false;
            _weatherBloc.add(CollapsedViewEvent());
          });
        } else {
          setState(() {
            _isExpanded = true;
            _weatherBloc.add(ExpandedViewEvent());
          });
        }
      },
    );
  }

  @override
  void didChangeDependencies() {
    height = MediaQuery.of(context).size.height;
    collapsedHeight = height * 0.45;
    expandedHeight = height * 0.75;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _weatherBloc = sl<WeatherBloc>();
    _isExpanded = true;

    /// add [ExpandedViewEvent] to the Bloc
    _weatherBloc.add(ExpandedViewEvent());
    _scrollManager(widget.scrollController);

    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(() {});
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: const ExpandedView(),
      secondChild: const CollapsedView(),
      crossFadeState:
          _isExpanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 250),
    );
  }
}

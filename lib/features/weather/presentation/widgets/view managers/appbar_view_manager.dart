import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/core/constants/logger.dart';
import 'package:weather/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/widgets/views%20appbar/collapsed_view.dart';
import 'package:weather/features/weather/presentation/widgets/views%20appbar/expanded_view.dart';

class ViewManager extends StatefulWidget {
  /// Manages the view . In default it returns [ExpandedView] if user scrolls the
  /// screen it returns [CollapsedView] and changes the state.
  const ViewManager({
    Key? key,
    required this.size,
  }) : super(key: key);
  final BoxConstraints size;
  @override
  State<ViewManager> createState() => _ViewManagerState();
}

class _ViewManagerState extends State<ViewManager>
    with SingleTickerProviderStateMixin {
  ///
  late bool _isExpanded;

  final sl = GetIt.instance;
  late WeatherBloc _weatherBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _weatherBloc = sl<WeatherBloc>();
    _isExpanded = true;

    /// add [ExpandedViewEvent] to the Bloc
    _weatherBloc.add(ExpandedViewEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherBloc, WeatherState>(
      bloc: _weatherBloc,
      listener: (context, state) {
        if (state is CollapsedViewState) {
          setState(() {
            _isExpanded = false;
          });
        } else {
          setState(() {
            _isExpanded = true;
          });
        }
      },
      child: AnimatedCrossFade(
        firstChild: ExpandedView(
          expandedHeight: widget.size.maxHeight,
        ),
        secondChild: CollapsedView(
          collapsedHeight: widget.size.minHeight,
        ),
        crossFadeState:
            _isExpanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 250),
      ),
    );
  }
}

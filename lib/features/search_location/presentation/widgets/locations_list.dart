import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/location_model.dart';
import '../../../../injection_container.dart';
import '../../../weather/presentation/pages/home.dart';
import '../bloc/search_location_bloc.dart';
import 'location_tile.dart';

class LocationsList extends StatefulWidget {
  final SearchLocationBloc searchLocationBloc;
  const LocationsList({
    Key? key,
    required this.searchLocationBloc,
  }) : super(key: key);

  @override
  State<LocationsList> createState() => _LocationsListState();
}

class _LocationsListState extends State<LocationsList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<SearchLocationBloc, SearchLocationState>(
        bloc: widget.searchLocationBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LoadedSuccessState) {
            return ListView.builder(
              itemCount: state.predictions.predictions!.length,
              itemBuilder: (contex, index) {
                final String _text =
                    state.predictions.predictions![index]["description"];

                return LocationTile(
                  text: _text,
                  onTap: () {
                    sl<LocationViewModel>().query = _text;
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const HomePage(),
                      ),
                    );
                  },
                );
              },
            );
          }
          if (state is LoadedFailState) {
            return Center(
              child: Text(state.exception),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

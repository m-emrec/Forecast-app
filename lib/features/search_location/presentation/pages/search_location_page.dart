// ignore_for_file: public_member_api_docs, sort_constructors_first, no_leading_underscores_for_local_identifiers
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/constants/strings.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/empty_padding.dart';
import 'package:weather/core/resources/location_model.dart';
import 'package:weather/features/search_location/presentation/bloc/search_location_bloc.dart';
import 'package:weather/features/search_location/presentation/widgets/location_tile.dart';
import 'package:weather/features/weather/presentation/pages/home.dart';
import 'package:weather/injection_container.dart';

class SearchLocationPage extends StatefulWidget {
  const SearchLocationPage({super.key});

  @override
  State<SearchLocationPage> createState() => _SearchLocationPageState();
}

class _SearchLocationPageState extends State<SearchLocationPage> {
  ///
  late GetIt sl;
  late SearchLocationBloc _searchLocationBloc;
  @override
  void initState() {
    sl = GetIt.instance;
    _searchLocationBloc = sl<SearchLocationBloc>();
    _searchLocationBloc.add(SearchLocationInitialEvent());
    super.initState();
  }

  List b = ["Turkey", "America", "Germany"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),

        /// Search Bar
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocConsumer<SearchLocationBloc, SearchLocationState>(
              bloc: _searchLocationBloc,
              listener: (context, state) {},
              builder: (context, state) {
                return SearchBar(
                  hintStyle:
                      MaterialStatePropertyAll(context.textTheme.bodySmall),
                  hintText: "Search Location...",
                  leading: Icon(
                    Icons.search,
                    color: context.theme.scaffoldBackgroundColor,
                  ),
                  onChanged: (value) =>
                      _searchLocationBloc.add(SearchEvent(value)),
                  textStyle: MaterialStatePropertyAll(
                    context.textTheme.labelLarge,
                  ),
                );
              },
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LocationTile(
              onTap: () {
                sl<LocationViewModel>().query = null;
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => const HomePage(),
                  ),
                );
              },
            ),
            // const Divider(
            //   endIndent: 0,
            //   indent: 0,
            //   color: Colors.white54,
            // ),
            16.ph,
            LocationsList(searchLocationBloc: _searchLocationBloc),
          ],
        ),
      ),
    );
  }
}

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

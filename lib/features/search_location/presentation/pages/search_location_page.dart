// ignore_for_file: public_member_api_docs, sort_constructors_first, no_leading_underscores_for_local_identifiers, unused_import
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/empty_padding.dart';
import 'package:weather/core/resources/location_model.dart';
import 'package:weather/features/search_location/presentation/bloc/search_location_bloc.dart';
import 'package:weather/features/search_location/presentation/widgets/location_tile.dart';
import 'package:weather/features/weather/presentation/pages/home.dart';
import 'package:weather/injection_container.dart';

import '../widgets/locations_list.dart';

class SearchLocationPage extends StatefulWidget {
  const SearchLocationPage({super.key});

  @override
  State<SearchLocationPage> createState() => _SearchLocationPageState();
}

class _SearchLocationPageState extends State<SearchLocationPage> {
  final FocusNode _focusNode = FocusNode();
  late GetIt sl;
  late SearchLocationBloc _searchLocationBloc;
  @override
  void initState() {
    sl = GetIt.instance;
    _searchLocationBloc = sl<SearchLocationBloc>();
    _searchLocationBloc.add(SearchLocationInitialEvent());
    _focusNode.requestFocus();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// Just to handle focus problem on some devices
    if (MediaQuery.of(context).viewInsets == EdgeInsets.zero) {
      _focusNode.unfocus();
    }
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

            //*Search Bar
            child: SearchBar(
              onTap: () => _focusNode.requestFocus(),
              focusNode: _focusNode..skipTraversal = false,
              hintStyle: MaterialStatePropertyAll(context.textTheme.bodySmall),
              hintText: "Search Location...",
              leading: Icon(
                Icons.search,
                color: context.theme.scaffoldBackgroundColor,
              ),
              onChanged: (value) => _searchLocationBloc.add(SearchEvent(value)),
              textStyle: MaterialStatePropertyAll(
                context.textTheme.labelLarge,
              ),
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
            /// Use Current Location Tile
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

            /// Spacing
            16.ph,

            /// List of location Predictions
            LocationsList(searchLocationBloc: _searchLocationBloc),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/constants/strings.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/empty_padding.dart';
import 'package:weather/features/search_location/presentation/widgets/location_tile.dart';

class SearchLocationPage extends StatefulWidget {
  const SearchLocationPage({super.key});

  @override
  State<SearchLocationPage> createState() => _SearchLocationPageState();
}

class _SearchLocationPageState extends State<SearchLocationPage> {
  ///
  a(String query) async {
    Uri uri = Uri.https(
      "maps.googleapis.com",
      "maps/api/place/autocomplete/json",
      {
        "input": query,
        "key": MAPS_API_KEY,
      },
    );
    final res = await http.get(uri);

    logger.i(res.body);
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
            child: SearchBar(
              hintStyle: MaterialStatePropertyAll(context.textTheme.bodySmall),
              hintText: "Search Location...",
              leading: Icon(
                Icons.search,
                color: context.theme.scaffoldBackgroundColor,
              ),
              onChanged: (value) => a(value),
              textStyle: MaterialStatePropertyAll(
                context.textTheme.labelLarge,
              ),
            ),
          ),
        ),

        // title: Text("Seacrh Location"),
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
              onTap: () {},
            ),
            // const Divider(
            //   endIndent: 0,
            //   indent: 0,
            //   color: Colors.white54,
            // ),
            16.ph,
            Expanded(
              child: ListView.builder(
                itemCount: b.length,
                itemBuilder: (contex, index) {
                  return LocationTile(
                    text: b[index],
                    onTap: () {},
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

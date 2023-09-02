import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/constants/strings.dart';
import 'package:weather/core/extensions/context_extension.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SearchBar(
                  onChanged: (value) => a(value),
                  constraints: BoxConstraints(
                    maxHeight: 50,
                    // maxWidth: MediaQuery.of(context).size.width * 0.9,
                  ),
                  textStyle: MaterialStatePropertyAll(
                    context.textTheme.labelSmall,
                  ),
                ),
              ),
              const Text(
                "data",
                style: TextStyle(color: Colors.white),
              ),
              ElevatedButton(
                onPressed: () => a("Turk"),
                child: const Text(
                  "RUN",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/image_extension.dart';

class DailyWeatherSection extends StatefulWidget {
  const DailyWeatherSection({super.key});

  @override
  State<DailyWeatherSection> createState() => _DailyWeatherSectionState();
}

class _DailyWeatherSectionState extends State<DailyWeatherSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListTile(
                title: Text(
                  "Day",
                  style: context.textTheme.bodyMedium,
                ),
              ));
        },
      ),
    );
  }
}

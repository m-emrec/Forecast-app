import 'package:flutter/material.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/empty_padding.dart';
import 'package:weather/core/extensions/image_extension.dart';

class HourlyWeatherSection extends StatefulWidget {
  const HourlyWeatherSection({super.key});

  @override
  State<HourlyWeatherSection> createState() => _HourlyWeatherSectionState();
}

class _HourlyWeatherSectionState extends State<HourlyWeatherSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Today  7 days button
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today",
                style: context.textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "7 days >",
                  style: context.textTheme.bodySmall!.copyWith(
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 24,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        width: 1,
                        color: const Color(0xFFDBEAFD),
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        /// Deggree
                        Text(
                          "23°",
                          style: context.textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),

                        /// Weather Icon
                        Image(
                          height: 24,
                          width: 24,
                          image: AssetImage("snow".toPng),
                        ),

                        /// Hour
                        Text(
                          "11:00",
                          style: context.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

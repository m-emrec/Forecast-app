import 'package:flutter/material.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/image_extension.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width * 0.3,
            child: Column(
              children: [
                Image.asset("wind-icon".toPng),
                Text(
                  "13 km/h",
                  style: context.textTheme.labelMedium,
                ),
                Text(
                  "Wind",
                  style: context.textTheme.labelSmall,
                ),
              ],
            ),
          ),
          SizedBox(
            width: width * 0.3,
            child: Column(
              children: [
                Image.asset("humidity".toPng),
                Text(
                  "25%",
                  style: context.textTheme.labelMedium,
                ),
                Text(
                  "Humidity",
                  style: context.textTheme.labelSmall,
                ),
              ],
            ),
          ),
          SizedBox(
            width: width * 0.3,
            child: Column(
              children: [
                Image.asset(
                  "chance-of-rain".toPng,
                  height: 24,
                  width: 24,
                ),
                Text(
                  "10%",
                  style: context.textTheme.labelMedium,
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Chance of Rain",
                    style: context.textTheme.labelSmall,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

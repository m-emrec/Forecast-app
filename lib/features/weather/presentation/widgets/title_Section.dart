import 'package:flutter/material.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/empty_padding.dart';

class TitleSectionExpanded extends StatelessWidget {
  const TitleSectionExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text.rich(
          TextSpan(
            text: " 23",
            style: context.textTheme.bodyLarge,
            children: const [
              TextSpan(
                text: "℃",
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
        Text(
          "Storm",
          style: context.textTheme.bodyMedium,
        ),
        16.ph,
        Text(
          "Wednesday , 23 Aug",
          style: context.textTheme.bodySmall,
        ),
      ],
    );
  }
}

class TitleSectionCollapsed extends StatelessWidget {
  const TitleSectionCollapsed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Tomorrow",
          style: context.textTheme.bodyMedium,
        ),
        Text.rich(
          TextSpan(
            text: " 23",
            style: context.textTheme.bodyLarge,
            children: const [
              TextSpan(
                text: "℃",
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
        Text(
          "Storm",
          style: context.textTheme.bodySmall,
        ),
        16.ph,
      ],
    );
  }
}

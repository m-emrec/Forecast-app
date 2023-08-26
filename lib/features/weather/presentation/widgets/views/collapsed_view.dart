import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather/core/extensions/empty_padding.dart';
import 'package:weather/core/extensions/image_extension.dart';
import 'package:weather/features/weather/presentation/widgets/info_section.dart';

import '../title_Section.dart';

class CollapsedView extends StatefulWidget {
  const CollapsedView({super.key});

  @override
  State<CollapsedView> createState() => _CollapsedViewState();
}

class _CollapsedViewState extends State<CollapsedView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppBar(
          forceMaterialTransparency: true,
          centerTitle: true,
          leadingWidth: 48,

          /// Down button
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: const Color(0xFFF8F8F8).withOpacity(0.5),
                ),
              ),
              child: const Icon(
                Icons.keyboard_arrow_down_sharp,
                size: 24,
              ),
            ),
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.calendar_today_outlined),
              8.pw,
              const Text("7 days"),
            ],
          ),

          /// Setting Button
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                child: Image.asset("settings-button".toPng),
              ),
            ),
          ],
        ),
        16.ph,

        /// Weather Image
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              width: 128,
              height: 128,
              image: AssetImage(
                "snow".toPng,
              ),
            ),

            /// Title Section
            const TitleSectionCollapsed(),
          ],
        ),
        32.ph,
        const Divider(),

        const InfoSection(),
      ],
    );
  }
}

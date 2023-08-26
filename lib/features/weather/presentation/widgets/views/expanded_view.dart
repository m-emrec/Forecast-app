import 'package:flutter/material.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/empty_padding.dart';
import 'package:weather/core/extensions/image_extension.dart';
import 'package:weather/features/weather/presentation/widgets/title_Section.dart';

import '../info_section.dart';

class ExpandedView extends StatefulWidget {
  const ExpandedView({super.key});

  @override
  State<ExpandedView> createState() => _ExpandedViewState();
}

class _ExpandedViewState extends State<ExpandedView> {
  @override
  void initState() {
    // TODO: add Appbar expanded event
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        height: constraints.maxHeight,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppBar(
                forceMaterialTransparency: true,
                centerTitle: true,

                /// Locations button
                leading: GestureDetector(
                  child: Image.asset("menu-button".toPng),
                ),
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.location_on_outlined),
                    8.pw,
                    Text(
                      "Kadıköy",
                      style: context.textTheme.titleLarge,
                    ),
                  ],
                ),

                /// Settings button
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
              Image(
                image: AssetImage(
                  "snow".toPng,
                ),
              ),

              /// Title Section
              const TitleSectionExpanded(),
              8.ph,
              const Divider(),

              /// More Info Section
              const InfoSection(),
            ],
          ),
        ),
      ),
    );
  }
}

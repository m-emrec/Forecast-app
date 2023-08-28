import 'package:flutter/material.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/empty_padding.dart';
import 'package:weather/core/extensions/image_extension.dart';

import '../widgets/info_section.dart';
import '../widgets/title_Section.dart';

class LoadingData extends StatefulWidget {
  const LoadingData({super.key});

  @override
  State<LoadingData> createState() => _LoadingDataState();
}

class _LoadingDataState extends State<LoadingData> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class LoadingAppBar extends StatefulWidget {
  const LoadingAppBar({super.key});

  @override
  State<LoadingAppBar> createState() => _LoadingAppBarState();
}

class _LoadingAppBarState extends State<LoadingAppBar> {
  late double expandedHeigt;
  late double height;
  @override
  void didChangeDependencies() {
    height = MediaQuery.of(context).size.height;
    expandedHeigt = height * 0.75;

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  // expandedHeight = height * 0.75;
  //
  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xFF73B2EF),
          width: 3,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            72.0,
          ),
          bottomRight: Radius.circular(72),
        ),
      ),
      flexibleSpace: Container(
        height: expandedHeigt,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(
              72.0,
            ),
            bottomRight: Radius.circular(72),
          ),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 12),
              color: Color(0xFF074090),
              blurRadius: 4,
            )
          ],
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF11B5FD).withOpacity(0.7),
              const Color(0xFF0F68F4).withOpacity(0.7),
            ],
          ),
        ),
        child: LoadingExpandedViews(),
      ),
    );
  }
}

class LoadingExpandedViews extends StatefulWidget {
  const LoadingExpandedViews({super.key});

  @override
  State<LoadingExpandedViews> createState() => _LoadingExpandedViewsState();
}

class _LoadingExpandedViewsState extends State<LoadingExpandedViews> {
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
              const ExpandedInfoSection(),
            ],
          ),
        ),
      ),
    );
  }
}

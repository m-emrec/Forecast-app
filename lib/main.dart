import 'package:flutter/material.dart';
import 'package:weather/config/theme/app_theme.dart';
import 'package:weather/features/search_location/presentation/pages/search_location_page.dart';
import 'package:weather/injection_container.dart';

import 'features/weather/presentation/pages/a.dart';
import 'features/weather/presentation/pages/home.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      title: 'Flutter Demo',
      home: const SearchLocationPage(),
    );
  }
}

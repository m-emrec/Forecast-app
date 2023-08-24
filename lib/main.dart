import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/config/theme/app_theme.dart';
import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/constants/strings.dart';
import 'package:weather/features/weather/data/datasources/remote/weather_api_service.dart';
import 'package:weather/injection_container.dart';

import 'features/weather/presentation/bloc/weather_bloc.dart';
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
      home: HomePage(),
    );
  }
}

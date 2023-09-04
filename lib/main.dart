import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/config/theme/app_theme.dart';
import 'package:weather/core/resources/location_model.dart';
import 'package:weather/injection_container.dart';

import 'features/weather/presentation/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  sl<LocationViewModel>().query = sl<SharedPreferences>().getString("query");

  // TODO : Settings = SharedPrefs
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
      home: const HomePage(),
    );
  }
}

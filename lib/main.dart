import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/config/theme/app_theme.dart';
import 'package:weather/core/resources/error_management_widget.dart';
import 'package:weather/core/resources/error_manager.dart';
import 'package:weather/core/resources/location_model.dart';
import 'package:weather/injection_container.dart';

import 'features/weather/presentation/pages/home.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
  ));
  await initializeDependencies();
  sl<LocationViewModel>().query = sl<SharedPreferences>().getString("query");

  ErrorWidget.builder = (details) {
    return ErrorManagerWidget(
      details: details,
    );
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      title: 'Flutter Demo',
      home: const HomePage(),
    );
  }
}

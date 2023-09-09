// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/empty_padding.dart';
import 'package:weather/features/settings/presentation/widgets/settings_switch_card.dart';
import 'package:weather/features/weather/presentation/pages/home.dart';
import 'package:weather/features/weather/presentation/pages/loading_data.dart';

import '../../../../injection_container.dart';
import '../bloc/settings_bloc.dart';
import '../widgets/settings_choice_card.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SettingsBloc _settingsBloc;
  @override
  void initState() {
    _settingsBloc = sl<SettingsBloc>();
    _settingsBloc.add(GetSettingsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop("a"),
        ),
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16,
        ),
        child: BlocConsumer<SettingsBloc, SettingsState>(
          bloc: _settingsBloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LoadedSettingsSuccessState) {
              return Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Units"),
                      4.ph,

                      /// Temperature
                      SettingsChoiceCard(
                        title: "Temperature",
                        choices: const ["Celcius", "Fahrenheit"],
                        selected: state.settings.temperatureUnit!,
                        onSelected: (String newVal) => _settingsBloc.add(
                          ChangeTemperatureSettingsEvent(newVal),
                        ),
                      ),

                      /// Wind Speed
                      SettingsChoiceCard(
                        title: "Wind Speed",
                        choices: const ["kph", "mph"],
                        selected: state.settings.windSpeedUnit!,
                        onSelected: (String newVal) => _settingsBloc.add(
                          ChangeWindSpeedSettingsEvent(newVal),
                        ),
                      ),
                    ],
                  ),
                  32.ph,
                  //* Notifications
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Notifications"),
                      4.ph,
                      SettingsSwitchCard(
                        title: "Allow Notifications",
                        icon: Icons.notifications_active_outlined,
                        value: state.settings.allowNotification!,
                        onChanged: (bool val) => _settingsBloc
                            .add(ChangeNotificationSettingsEvent(val)),
                      ),
                    ],
                  ),
                  32.ph,
                  //* Permissions
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text("Permissions"),
                  //     4.ph,
                  //     SettingsSwitchCard(
                  //       title: "Location",
                  //       icon: Icons.location_on_outlined,
                  //       value: state.settings.allowLocation!,
                  //       onChanged: (bool newVal) => _settingsBloc.add(
                  //         ChangeLocationSettingsEvent(newVal),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              );
            }
            if (state is LoadingSettingsState) {
              return LoadingData();
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}

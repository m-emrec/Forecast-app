// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/core/extensions/empty_padding.dart';
import 'package:weather/features/settings/presentation/widgets/settings_switch_card.dart';

import '../widgets/settings_choice_card.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                ),

                /// Wind Speed
                SettingsChoiceCard(
                  title: "Wind Speed",
                  choices: const ["kph", "mph"],
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
                ),
              ],
            ),
            32.ph,
            //* Permissions
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Permissions"),
                4.ph,
                SettingsSwitchCard(
                  title: "Location",
                  icon: Icons.location_on_outlined,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

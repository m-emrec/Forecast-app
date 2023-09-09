import 'package:flutter/material.dart';
import 'package:weather/core/extensions/context_extension.dart';

class SettingsSwitchCard extends StatefulWidget {
  final String title;
  final IconData? icon;
  final Function? onChanged;
  final bool value;
  const SettingsSwitchCard({
    super.key,
    required this.title,
    this.onChanged,
    this.icon,
    required this.value,
  });

  @override
  State<SettingsSwitchCard> createState() => _SettingsSwitchCardState();
}

class _SettingsSwitchCardState extends State<SettingsSwitchCard> {
  late bool val;
  @override
  void initState() {
    val = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: widget.icon == null
            ? null
            : Icon(
                widget.icon,
                color: Colors.white,
              ),
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          widget.title,
          style: context.textTheme.labelMedium,
        ),
        trailing: Switch.adaptive(
          activeTrackColor: const Color(0xFF074090),
          applyCupertinoTheme: true,
          value: val,
          onChanged: (newVal) {
            setState(() {
              val = newVal;
            });
            widget.onChanged == null ? () {} : widget.onChanged!(val);
          },
        ),
      ),
    );
  }
}

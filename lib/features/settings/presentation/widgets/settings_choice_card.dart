// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:weather/core/constants/logger.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/features/settings/presentation/bloc/settings_bloc.dart';

class SettingsChoiceCard extends StatefulWidget {
  const SettingsChoiceCard({
    super.key,
    required this.title,
    required this.choices,
    required this.selected,
    required this.onSelected,
  });
  final String title;
  final Function onSelected;
  final List<String> choices;
  final String selected;
  @override
  State<SettingsChoiceCard> createState() => _SettingsChoiceCardState();
}

class _SettingsChoiceCardState extends State<SettingsChoiceCard> {
  late String _selectedVal;
  @override
  void initState() {
    _selectedVal = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: double.maxFinite,
        child: Card(
          color: context.theme.cardTheme.color,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: context.textTheme.bodySmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: widget.choices.map((label) {
                    bool _isSelected =
                        _selectedVal.toLowerCase() == label.toLowerCase();
                    return ChoiceChip(
                      labelPadding: const EdgeInsets.symmetric(horizontal: 32),
                      labelStyle: context.textTheme.labelMedium!.copyWith(
                        fontWeight:
                            _isSelected ? FontWeight.w800 : FontWeight.w400,
                      ),
                      label: SizedBox(
                        width: size.width * 0.2,
                        child: Center(
                          child: Text(
                            label,
                          ),
                        ),
                      ),
                      selected: _isSelected,
                      disabledColor: Colors.black,
                      backgroundColor: Colors.black,
                      //0xFF074090
                      selectedColor: const Color(0xFF074090),

                      onSelected: (value) {
                        if (value) {
                          widget.onSelected(label);
                          setState(() {
                            _selectedVal = label;
                          });
                        }
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

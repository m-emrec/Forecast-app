// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:weather/core/extensions/context_extension.dart';

class LocationTile extends StatefulWidget {
  final String? text;
  final VoidCallback onTap;
  const LocationTile({
    Key? key,
    this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  State<LocationTile> createState() => _LocationTileState();
}

class _LocationTileState extends State<LocationTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        widget.text == null
            ? Icons.location_searching
            : Icons.location_on_outlined,
        color: Colors.white70,
        size: 32,
      ),
      title: Text(
        widget.text ?? "Use Current Location",
        style: context.textTheme.bodySmall!.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white70,
        ),
      ),
      contentPadding: const EdgeInsets.all(8.0),
      onTap: widget.onTap,
    );
  }
}

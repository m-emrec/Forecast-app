import 'package:flutter/material.dart';
import 'package:weather/core/extensions/context_extension.dart';

class ErrorAlert extends StatefulWidget {
  final String? error;
  const ErrorAlert({
    super.key,
    this.error,
  });

  @override
  State<ErrorAlert> createState() => _ErrorAlertState();
}

class _ErrorAlertState extends State<ErrorAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.red.shade900,
      title: Text(
        widget.error ?? "",
        style: context.textTheme.bodyMedium,
      ),
      elevation: 3,
    );
  }
}

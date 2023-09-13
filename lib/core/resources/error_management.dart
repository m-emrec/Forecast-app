// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:weather/core/constants/logger.dart';

import 'package:weather/core/resources/error_manager.dart';

class ErrorWidget extends StatefulWidget {
  final ErrorManager? errorManager;
  final String? exception;
  const ErrorWidget({
    Key? key,
    this.errorManager,
    this.exception,
  }) : super(key: key);

  @override
  State<ErrorWidget> createState() => _ErrorWidgetState();
}

class _ErrorWidgetState extends State<ErrorWidget> {
  @override
  Widget build(BuildContext context) {
    logger.d("Error Manager");
    return Scaffold(
      body: Center(
        child: Card(
          child: Text(
            widget.errorManager!.errorConverter(widget.exception ?? ""),
          ),
        ),
      ),
    );
  }
}

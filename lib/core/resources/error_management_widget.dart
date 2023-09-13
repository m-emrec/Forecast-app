// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:weather/core/constants/logger.dart';

import 'package:weather/core/resources/error_manager.dart';
import 'package:weather/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/pages/home.dart';
import 'package:weather/injection_container.dart';

class ErrorManagerWidget extends StatefulWidget {
  final FlutterErrorDetails? details;
  const ErrorManagerWidget({
    Key? key,
    this.details,
  }) : super(key: key);

  @override
  State<ErrorManagerWidget> createState() => _ErrorManagerWidgetState();
}

class _ErrorManagerWidgetState extends State<ErrorManagerWidget> {
  final ErrorManager _errorManager = ErrorManager();
  late String exception;
  @override
  void initState() {
    exception = widget.details?.exceptionAsString() ?? "";
    widget.details!.summary;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    logger.d(widget.details!.summary);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Colors.red.shade900,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 32,
                  ),
                  child: FittedBox(
                    child: Text(
                      _errorManager.errorConverter(exception),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => HomePage())),
                child: Text("Refresh"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

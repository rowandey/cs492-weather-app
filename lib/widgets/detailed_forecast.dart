import 'package:flutter/material.dart';
import '../models/forecast.dart';

class DetailedForecast extends StatelessWidget {
  const DetailedForecast({
    super.key,
    required Forecast? activeForecast,
  }) : _activeForecast = activeForecast;

  final Forecast? _activeForecast;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // var accentColor;

    // if (_activeForecast != null) {
    //   accentColor = _activeForecast.isDaytime ? Colors.orange : Colors.indigo;
    // }

    final accentColor = _activeForecast!= null && _activeForecast.isDaytime ? Colors.orange : Colors.indigo;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          // Cannot use color here if a gradient is also specified
          gradient: LinearGradient(
            colors: [accentColor, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(20.0), // Rounded corners
        ),
        child: Column(
          children: [
            Text(
              "${_activeForecast != null ? _activeForecast.name : ""}:",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(_activeForecast != null ? _activeForecast.detailedForecast : ""),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weatherapp/models/forecast.dart';

class DetailedForecastText extends StatelessWidget {
  const DetailedForecastText({
    super.key,
    required this.activeForecast,
  });

  final Forecast activeForecast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            activeForecast.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4)),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                activeForecast.detailedForecast,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.4,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

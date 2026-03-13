import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/forecast_provider.dart';

import 'package:weatherapp/models/forecast.dart';
import 'package:weatherapp/providers/theme_provider.dart';
import 'package:weatherapp/widgets/forecast/wind_heading_indicator.dart';

class WindInfo extends StatelessWidget {
  const WindInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final forecastProvider = context.watch<ForecastProvider>();
    final themeProvider = context.watch<ThemeProvider>();
    String windDirection = forecastProvider.activeForecast!.windDirection;

    final angle = getAngleFromWindDirection(windDirection);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WindHeadingIndicator(angle: angle, themeProvider: themeProvider),
      ],
    );
  }
}

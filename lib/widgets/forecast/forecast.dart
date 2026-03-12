import 'package:flutter/material.dart';

import 'package:weatherapp/widgets/forecast/detailed_forecast/detailed_forecast.dart';
import 'package:weatherapp/widgets/forecast/forecast_tiles/forecasts_row.dart';
import 'package:weatherapp/widgets/forecast/wind_indicator.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: ForecastsRowWidget(),
        ),
        DetailedForecast(),
        WindIndicator()
      ],
    );
  }
}

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/forecast_provider.dart';

import 'package:weatherapp/models/forecast.dart';
import 'package:weatherapp/providers/theme_provider.dart';

class ShortestAngleTween extends Tween<double> {
  ShortestAngleTween({required double end}) : super(begin: end, end: end);

  @override
  double lerp(double t) {
    double diff = (end! - begin!);
    // force it to rotate the short way around
    diff = (diff + math.pi) % (2 * math.pi) - math.pi;
    return begin! + diff * t;
  }
}

class WindIndicator extends StatelessWidget {
  const WindIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final forecastProvider = context.watch<ForecastProvider>();
    final themeProvider = context.watch<ThemeProvider>();
    String windDirection = forecastProvider.activeForecast!.windDirection;
    // String windSpeed = forecastProvider.activeForecast!.windSpeed;

    final angle = getAngleFromWindDirection(windDirection);

    return Column(
      children: [
        Text("Wind Direction"),
        TweenAnimationBuilder<double>(
          tween: ShortestAngleTween(end: angle),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          builder: (context, value, _) => SizedBox(
            width: 200,
            height: 200,
            child: Stack(
              children: [
                SvgPicture.asset(
                  themeProvider.darkMode
                      ? 'assets/wind_direction/compass_dark.svg'
                      : 'assets/wind_direction/compass_light.svg',
                  width: 200,
                  height: 200,
                ),
                CustomPaint(
                  size: const Size(200, 200),
                  painter: WindLineDrawer(value),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class WindLineDrawer extends CustomPainter {
  final double angle;

  WindLineDrawer(this.angle);

  @override
  void paint(Canvas canvas, Size size) {
    // define paint
    final paint = Paint()
      ..color = const Color.fromARGB(255, 255, 155, 148)
      ..strokeWidth = 4.0;

    // move to center of containre
    final rotationCenterX = size.width / 2;
    final rotationCenterY = size.height / 2;
    canvas.translate(rotationCenterX, rotationCenterY);

    // 2. rotate canvas
    canvas.rotate(angle);

    // draw line from (0, 0) to right edge
    canvas.drawLine(Offset.zero, Offset(size.width / 4, 0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldPainter) {
    return oldPainter is WindLineDrawer && oldPainter.angle != angle;
  }
}

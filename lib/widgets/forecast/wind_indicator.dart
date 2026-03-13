import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/forecast_provider.dart';

import 'package:weatherapp/models/forecast.dart';

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
            width: 100,
            height: 100,
            child: CustomPaint(painter: WindLineDrawer(value)),
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
      ..color = Colors.red
      ..strokeWidth = 4.0;

    // move to center of containre
    final rotationCenterX = size.width / 2;
    final rotationCenterY = size.height / 2;
    canvas.translate(rotationCenterX, rotationCenterY);

    // 2. rotate canvas
    canvas.rotate(angle);

    // draw line from (0, 0) to right edge
    canvas.drawLine(Offset.zero, Offset(size.width / 2, 0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldPainter) {
    return oldPainter is WindLineDrawer && oldPainter.angle != angle;
  }
}

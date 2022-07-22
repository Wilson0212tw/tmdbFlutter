import 'dart:math' as math;

import 'package:flutter/material.dart';

class MyArc extends StatelessWidget {
  final double rate;
  final double diameter;
  final Color rateColor;
  final Color bgColor;
  const MyArc(
      {super.key,
      this.diameter = 40,
      this.rate = 0.75,
      required this.rateColor,
      this.bgColor = Colors.black});

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: MyPainter(rate, rateColor, bgColor),
        size: Size(diameter, diameter),
      );
}

// This is the Painter class
class MyPainter extends CustomPainter {
  final double rate;
  final Color rateColor;
  final Color bgColor;
  double get rateArcStp => -math.pi / 2;
  double get rateArc => rate * 2 * math.pi;
  double get rateArcCompleteStp => rateArcStp + rateArc;
  double get rateArcComplete => (1 - rate) * 2 * math.pi;

  MyPainter(this.rate, this.rateColor, this.bgColor) : super();
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = bgColor
      ..isAntiAlias = true
      ..strokeWidth = 0.0
      ..invertColors = false;

    Rect a = Rect.fromCenter(
      center: Offset(size.height / 2, size.width / 2),
      height: size.height,
      width: size.width,
    );

    Rect b = Rect.fromCenter(
      center: Offset(size.height / 2, size.width / 2),
      height: size.height * 0.85,
      width: size.width * 0.85,
    );
    Rect c = Rect.fromCenter(
      center: Offset(size.height / 2, size.width / 2),
      height: size.height * 0.7,
      width: size.width * 0.7,
    );

    canvas.drawArc(
      a,
      0,
      2 * math.pi,
      true,
      paint..color = bgColor,
    );

    canvas.drawArc(
      b,
      rateArcStp,
      rateArc,
      true,
      paint..color = rateColor,
    );
    canvas.drawArc(
      b,
      rateArcCompleteStp,
      rateArcComplete,
      true,
      paint..color = Colors.grey,
    );

    canvas.drawArc(
      c,
      0,
      2 * math.pi,
      true,
      paint..color = bgColor,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

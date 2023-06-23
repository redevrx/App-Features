
import 'dart:math';

import 'package:flutter/material.dart';

class CircleIndicator extends CustomPainter {
  const CircleIndicator({this.progress = 150.0,required this.mColor, required this.thickness});

  double deg2rad(double deg) => deg * pi / 180;
  ///double rad2deg(double rad) => rad * 180 / pi;

  final Color mColor;
  final double thickness;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {

    final center = Offset(size.width / 2, size.height / 2);

    final mPaint = Paint()
      ..color = Colors.grey.withOpacity(.23)
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness;

    final mPaintColor = Paint()
      ..color = mColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness;


    canvas.drawArc(Rect.fromCenter(center: center, width: size.width, height: size.height),
        deg2rad(0 + 1), deg2rad(360 - (1*2)), false, mPaint);

    canvas.drawArc(Rect.fromCenter(center: center, width: size.width, height: size.height),
        deg2rad(270), deg2rad(progress -(1*2)), false, mPaintColor);
  }

  @override
  bool shouldRepaint(covariant CircleIndicator oldDelegate) => true;

}
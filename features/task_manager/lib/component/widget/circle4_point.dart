import 'dart:math';

import 'package:flutter/material.dart';

class Circle4Point extends CustomPainter {
  final double thickness;
  final double gap;

  final Color bottomRightColor;
  final Color bottomLeftColor;
  final Color topRightColor;
  final Color topLeftColor;

  Circle4Point({
    required this.gap,
    required this.thickness,
    required this.bottomLeftColor,
    required this.bottomRightColor,
    required this.topLeftColor,
    required this.topRightColor,
  });

  double deg2rad(double deg) => deg * pi / 180;

  //double rad2deg(double rad) => rad * 180 / pi;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);


    Paint paintTr = Paint()
      ..color = topRightColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness;

    Paint paintBr = Paint()
      ..color = bottomRightColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness;

    Paint paintBl = Paint()
      ..color = bottomLeftColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness;

    Paint paintTl = Paint()
      ..color = topLeftColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness;

    ///Bottom Right:: ok
    canvas.drawArc(
        Rect.fromCenter(center: center, width: size.width, height: size.height),
        deg2rad(320 + gap),
        deg2rad(50 - (gap * 2)),
        false,
        paintBr);

    ///BottomLeft :: Ok
    canvas.drawArc(
        Rect.fromCenter(center: center, width: size.width, height: size.height),
        deg2rad(24 + gap),
        deg2rad(54 - (gap * 2)),
        false,
        paintBl);

    ///TopLeft
    canvas.drawArc(
        Rect.fromCenter(center: center, width: size.width, height: size.height),
        deg2rad(94 + gap),
        deg2rad(144 - (gap * 2)),
        false,
        paintTl);

    ///Top Right :: OK
    canvas.drawArc(
        Rect.fromCenter(center: center, width: size.width, height: size.height),
        deg2rad(256 + gap),
        deg2rad(50 - (gap * 2)),
        false,
        paintTr);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
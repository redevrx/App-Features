import 'dart:math';
import 'package:flutter/material.dart';

class MyPaint extends CustomPainter {

  final double percen;

  MyPaint(this.percen);
  @override
  void paint(Canvas canvas, Size size) {

    canvas.drawPaint(Paint()
      ..color = Colors.blue);

    final rect = Rect.fromCenter(center: Offset(size.width / 2 , size.height / 2), width: 50 * 2, height: 50 * 2);
    canvas.drawArc(rect, -90 * pi / 180.0, 180.0, false, Paint()..color = Colors.red..strokeWidth = 10..style =  PaintingStyle.stroke);
    canvas.drawArc(rect, -90 * pi / 180.0, percen * pi / 180.0, false, Paint()..color = Colors.green..strokeWidth = 10..style =  PaintingStyle.stroke);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}
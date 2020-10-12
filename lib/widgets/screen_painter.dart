import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ScreenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = Colors.white.withOpacity(0.28)
      ..strokeWidth = 3;
    canvas.drawLine(Offset(20, 0), Offset(size.width - 20, 0), line);

    final paint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(0, 0),
        Offset(0, size.height),
        [
          Color(0xFFC4C4C4).withOpacity(0.25),
          Colors.transparent,
        ],
      );

    var path = Path();
    path.lineTo(20, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - 20, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(ScreenPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(ScreenPainter oldDelegate) => false;
}

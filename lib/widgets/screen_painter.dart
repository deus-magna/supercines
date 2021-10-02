import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ScreenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final line = Paint()
      ..color = Colors.white.withOpacity(0.28)
      ..strokeWidth = 3;
    canvas.drawLine(const Offset(20, 0), Offset(size.width - 20, 0), line);

    final paint = Paint()
      ..shader = ui.Gradient.linear(
        Offset.zero,
        Offset(0, size.height),
        [
          const Color(0xFFC4C4C4).withOpacity(0.25),
          Colors.transparent,
        ],
      );

    final path = Path()
      ..lineTo(20, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - 20, 0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(ScreenPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(ScreenPainter oldDelegate) => false;
}

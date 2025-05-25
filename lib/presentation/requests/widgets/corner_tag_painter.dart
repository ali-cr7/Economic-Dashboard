import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CornerTagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.transparent;
    final path =
        Path()
          ..moveTo(size.width, 0)
          ..lineTo(size.width, size.height)
          ..lineTo(0, 0)
          ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

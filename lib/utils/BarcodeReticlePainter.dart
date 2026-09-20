import 'package:flutter/material.dart';

class BarcodeReticlePainter extends CustomPainter {
  final Color cornerColor;
  final double cornerLength;
  final double strokeWidth;

  BarcodeReticlePainter({
    required this.cornerColor,
    this.cornerLength = 26.0,
    this.strokeWidth = 3.5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = cornerColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double w = size.width;
    final double h = size.height;

    // Top-Left
    canvas.drawPath(
      Path()
        ..moveTo(0, cornerLength)
        ..lineTo(0, 8)
        ..quadraticBezierTo(0, 0, 8, 0)
        ..lineTo(cornerLength, 0),
      paint,
    );

    // Top-Right
    canvas.drawPath(
      Path()
        ..moveTo(w - cornerLength, 0)
        ..lineTo(w - 8, 0)
        ..quadraticBezierTo(w, 0, w, 8)
        ..lineTo(w, cornerLength),
      paint,
    );

    // Bottom-Left
    canvas.drawPath(
      Path()
        ..moveTo(0, h - cornerLength)
        ..lineTo(0, h - 8)
        ..quadraticBezierTo(0, h, 8, h)
        ..lineTo(cornerLength, h),
      paint,
    );

    // Bottom-Right
    canvas.drawPath(
      Path()
        ..moveTo(w - cornerLength, h)
        ..lineTo(w - 8, h)
        ..quadraticBezierTo(w, h, w, h - 8)
        ..lineTo(w, h - cornerLength),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant BarcodeReticlePainter oldDelegate) {
    return oldDelegate.cornerColor != cornerColor;
  }
}
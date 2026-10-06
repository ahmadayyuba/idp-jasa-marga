import 'dart:math';
import 'package:flutter/material.dart';

class GaugePainter extends CustomPainter {
  final double valuePercent; // 0.0 sampai 1.0 (posisi jarum)

  GaugePainter({required this.valuePercent});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.85);
    final radius = size.width * 0.42;
    const strokeWidth = 14.0;

    final paintArc = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    const startAngle = pi; // 180 derajat (mulai dari kiri)
    const totalSweep = pi; // 180 derajat busur lingkaran atas

    // Segment 1: Hijau (Lancar) - 30%
    paintArc.color = const Color(0xFF10B981);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      totalSweep * 0.30 - 0.05,
      false,
      paintArc,
    );

    // Segment 2: Oranye/Kuning (Sedikit Padat / Cukup Padat) - 40%
    paintArc.color = const Color(0xFFF59E0B);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle + totalSweep * 0.30,
      totalSweep * 0.40 - 0.05,
      false,
      paintArc,
    );

    // Segment 3: Merah (Padat / Sangat Padat) - 30%
    paintArc.color = const Color(0xFFEF4444);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle + totalSweep * 0.70,
      totalSweep * 0.30,
      false,
      paintArc,
    );

    // Draw Jarum (Needle)
    final needleAngle = startAngle + (totalSweep * valuePercent.clamp(0.0, 1.0));
    final needleLength = radius - 4;
    final needleEnd = Offset(
      center.dx + needleLength * cos(needleAngle),
      center.dy + needleLength * sin(needleAngle),
    );

    final paintNeedle = Paint()
      ..color = const Color(0xFF003399)
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(center, needleEnd, paintNeedle);

    // Engsel Jarum (Center Circle)
    final paintPivotOuter = Paint()..color = const Color(0xFF003399);
    final paintPivotInner = Paint()..color = Colors.white;

    canvas.drawCircle(center, 6, paintPivotOuter);
    canvas.drawCircle(center, 3, paintPivotInner);
  }

  @override
  bool shouldRepaint(covariant GaugePainter oldDelegate) {
    return oldDelegate.valuePercent != valuePercent;
  }
}
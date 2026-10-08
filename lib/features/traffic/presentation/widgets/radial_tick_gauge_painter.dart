import 'dart:math';
import 'package:flutter/material.dart';

class RadialTickGaugePainter extends CustomPainter {
  final double percent; 

  RadialTickGaugePainter({required this.percent});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2 + 5);
    final radius = size.width * 0.40;
    const totalTicks = 32;
    const startAngle = pi * 0.75; 
    const sweepAngle = pi * 1.5;   

    final activePaint = Paint()
      ..color = const Color(0xFF10B981)
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    final inactivePaint = Paint()
      ..color = const Color(0xFFE2E8F0)
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    final activeCount = (totalTicks * percent.clamp(0.0, 1.0)).round();

    for (int i = 0; i < totalTicks; i++) {
      final angle = startAngle + (sweepAngle * (i / (totalTicks - 1)));
      final isFilled = i < activeCount;
      final paint = isFilled ? activePaint : inactivePaint;

      final innerRadius = radius - 10;
      final outerRadius = radius;

      final p1 = Offset(
        center.dx + innerRadius * cos(angle),
        center.dy + innerRadius * sin(angle),
      );
      final p2 = Offset(
        center.dx + outerRadius * cos(angle),
        center.dy + outerRadius * sin(angle),
      );

      canvas.drawLine(p1, p2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant RadialTickGaugePainter oldDelegate) {
    return oldDelegate.percent != percent;
  }
}
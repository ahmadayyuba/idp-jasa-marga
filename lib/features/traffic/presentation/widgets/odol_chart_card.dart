import 'package:flutter/material.dart';
import 'dart:math';

class OdolChartCard extends StatelessWidget {
  const OdolChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Total Jumlah ODOL',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF003399),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              // Custom Donut Chart Ring
              SizedBox(
                width: 110,
                height: 110,
                child: CustomPaint(
                  painter: DonutChartPainter(),
                ),
              ),
              const SizedBox(width: 16),
              // Legend List
              Expanded(
                child: Column(
                  children: [
                    _buildLegendRow(const Color(0xFF0284C7), '5-20%', '57 kend'),
                    _buildLegendRow(const Color(0xFF10B981), '20-50%', '85 kend'),
                    _buildLegendRow(const Color(0xFFF59E0B), '50-100%', '91 kend'),
                    _buildLegendRow(const Color(0xFFEF4444), '>100%', '43 kend'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLegendRow(Color color, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF64748B),
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Painter untuk Menggambar Ring Donut Chart persis Figma
class DonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);
    const strokeWidth = 22.0;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    double startAngle = -pi / 2;

    final slices = [
      {'color': const Color(0xFF0284C7), 'sweep': 0.25 * 2 * pi},
      {'color': const Color(0xFF10B981), 'sweep': 0.30 * 2 * pi},
      {'color': const Color(0xFFF59E0B), 'sweep': 0.28 * 2 * pi},
      {'color': const Color(0xFFEF4444), 'sweep': 0.17 * 2 * pi},
    ];

    for (var slice in slices) {
      paint.color = slice['color'] as Color;
      final sweepAngle = slice['sweep'] as double;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        startAngle,
        sweepAngle - 0.05, // gap antar arc
        false,
        paint,
      );
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
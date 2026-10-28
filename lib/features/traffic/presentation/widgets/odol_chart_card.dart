import 'package:flutter/material.dart';
import 'dart:math';
import '../../../../core/constants/app_colors.dart';

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
            color: AppColors.primaryActive,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
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
                    _buildLegendRow(AppColors.brightBlue, '5-20%', '57 kend'),
                    _buildLegendRow(AppColors.successGreen, '20-50%', '85 kend'),
                    _buildLegendRow(AppColors.alertAmber, '50-100%', '91 kend'),
                    _buildLegendRow(AppColors.alertRed, '>100%', '43 kend'),
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
                color: AppColors.textSecondary,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
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
      {'color': AppColors.brightBlue, 'sweep': 0.25 * 2 * pi},
      {'color': AppColors.successGreen, 'sweep': 0.30 * 2 * pi},
      {'color': AppColors.alertAmber, 'sweep': 0.28 * 2 * pi},
      {'color': AppColors.alertRed, 'sweep': 0.17 * 2 * pi},
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
import 'package:flutter/material.dart';

class TrafficSpeedSummaryPills extends StatelessWidget {
  final String avgSpeed;
  final int busyPoints;
  final int smoothPoints;

  const TrafficSpeedSummaryPills({
    super.key,
    this.avgSpeed = '64 Km/J',
    this.busyPoints = 2,
    this.smoothPoints = 7,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Realtime Traffic',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildBadge(
                bgColor: const Color(0xFFE0F2FE),
                borderColor: const Color(0xFFBAE6FD),
                textColor: const Color(0xFF0284C7),
                icon: Icons.bolt_rounded,
                text: 'Rata2: $avgSpeed',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildBadge(
                bgColor: const Color(0xFFFEE2E2),
                borderColor: const Color(0xFFFECACA),
                textColor: const Color(0xFFDC2626),
                dotColor: const Color(0xFFEF4444),
                icon: Icons.bolt_rounded,
                text: '$busyPoints Titik Padat',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildBadge(
                bgColor: const Color(0xFFDCFCE7),
                borderColor: const Color(0xFFBBF7D0),
                textColor: const Color(0xFF16A34A),
                dotColor: const Color(0xFF0284C7),
                icon: Icons.bolt_rounded,
                text: '$smoothPoints Titik Lancar',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBadge({
    required Color bgColor,
    required Color borderColor,
    required Color textColor,
    Color? dotColor,
    IconData? icon,
    required String text,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: textColor, size: 20),
            const SizedBox(width: 4),
          ],
          if (dotColor != null) ...[
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

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
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildBadge(
                bgColor: AppColors.bgGradientStart,
                borderColor: AppColors.borderSkyBlue,
                textColor: AppColors.brightBlue,
                icon: Icons.bolt_rounded,
                text: 'Rata2: $avgSpeed',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildBadge(
                bgColor: AppColors.badgeRedBg,
                borderColor: AppColors.borderRedLight,
                textColor: AppColors.dangerRed,
                dotColor: AppColors.alertRed,
                icon: Icons.bolt_rounded,
                text: '$busyPoints Titik Padat',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildBadge(
                bgColor: AppColors.badgeGreenBg,
                borderColor: AppColors.borderGreenLight,
                textColor: AppColors.statusGreen,
                dotColor: AppColors.brightBlue,
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
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: textColor, size: 16),
            const SizedBox(width: 2),
          ],
          if (dotColor != null) ...[
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 4),
          ],
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                maxLines: 1,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

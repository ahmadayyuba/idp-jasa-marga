import 'package:flutter/material.dart';

import 'gauge_painter.dart';
import '../../../../core/constants/app_colors.dart';

class AntreanGaugeCard extends StatelessWidget {
  final String title;
  final String distance;
  final String statusText;
  final Color statusColor;
  final double needlePercent;

  const AntreanGaugeCard({
    super.key,
    required this.title,
    required this.distance,
    required this.statusText,
    required this.statusColor,
    required this.needlePercent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primaryActive,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 12),

          SizedBox(
            width: 120,
            height: 65,
            child: CustomPaint(
              painter: GaugePainter(valuePercent: needlePercent),
            ),
          ),
          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            decoration: BoxDecoration(
              color: AppColors.bgGradientEnd,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.dividerSlate),
            ),
            child: Text(
              distance,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: AppColors.slate700,
              ),
            ),
          ),
          const SizedBox(height: 18),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 14),
              Text(
                statusText,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

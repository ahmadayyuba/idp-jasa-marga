import 'package:flutter/material.dart';

import 'radial_tick_gauge_painter.dart';
import '../../../../core/constants/app_colors.dart';

class LalinGaugeCard extends StatelessWidget {
  final String title;
  final String totalCount;
  final String timeRange;
  final String updateTime;
  final double percent;

  const LalinGaugeCard({
    super.key,
    required this.title,
    required this.totalCount,
    this.timeRange = '12.00 - 13.00',
    this.updateTime = 'update 2026-08-27 10:10:08',
    this.percent = 0.55,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
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
          // 1. Badge Judul Lokasi
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.bgGradientEnd,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.dividerSlate),
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 12),

          // 2. Center Radial Gauge + Total Number
          SizedBox(
            width: 130,
            height: 110,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: const Size(130, 110),
                  painter: RadialTickGaugePainter(percent: percent),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(fontSize: 9, color: AppColors.textMuted),
                    ),
                    Text(
                      totalCount,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const Text(
                      'Kendaraan',
                      style: TextStyle(fontSize: 9, color: AppColors.textMuted),
                    ),
                    const SizedBox(height: 4),
                    // Pill Dropdown Jam
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.bgSlate,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.dividerSlate),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            timeRange,
                            style: const TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: AppColors.slate700,
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 10,
                            color: AppColors.slate700,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // 3. Legend Thresholds
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _LegendDot(color: AppColors.alertAmber, label: '>4.000'),
              SizedBox(width: 8),
              _LegendDot(color: AppColors.alertRed, label: '>5.500'),
            ],
          ),
          const SizedBox(height: 6),

          // 4. Update Time
          Text(
            updateTime,
            style: const TextStyle(fontSize: 8, color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}

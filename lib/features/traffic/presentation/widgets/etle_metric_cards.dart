import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class EtleMetricCards extends StatelessWidget {
  const EtleMetricCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Card 1: Total Pelanggaran
        Expanded(
          child: _buildMetricCard(
            bgColor: AppColors.crimsonRose,
            title: 'Total Pelanggaran',
            icon: Icons.camera_alt_rounded,
            value: '67',
            unit: 'Kasus',
            badgeWidget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                'Speed + WIM',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),

        // Card 2: Rata-Rata Kecepatan
        Expanded(
          child: _buildMetricCard(
            bgColor: AppColors.primaryBlue,
            title: 'Rata-Rata Kecepatan',
            icon: Icons.speed_rounded,
            value: '127.0',
            unit: 'Km/j',
            badgeWidget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                'Max 100 Km/j',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  color: AppColors.warningYellow, // Yellow Warning Text
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),

        // Card 3: Puncak Insiden
        Expanded(
          child: _buildMetricCard(
            bgColor: AppColors.darkEmerald,
            title: 'Puncak Insiden',
            icon: Icons.trending_up_rounded,
            value: '17',
            unit: 'Kasus',
            badgeWidget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                'Mar',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard({
    required Color bgColor,
    required String title,
    required IconData icon,
    required String value,
    required String unit,
    required Widget badgeWidget,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: bgColor.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white70,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(icon, size: 14, color: AppColors.white70),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                unit,
                style: const TextStyle(
                  fontSize: 9,
                  color: AppColors.white70,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          badgeWidget,
        ],
      ),
    );
  }
}
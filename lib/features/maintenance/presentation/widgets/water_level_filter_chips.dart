import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class WaterLevelFilterChips extends StatelessWidget {
  const WaterLevelFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildChip(
            label: 'Semua (4)',
            isActive: true,
          ),
          const SizedBox(width: 8),
          _buildChip(
            label: 'Perhatian (1)',
            isActive: false,
            icon: Icons.warning_amber_rounded,
            iconColor: AppColors.warningAmber,
          ),
          const SizedBox(width: 8),
          _buildChip(
            label: 'Pompa Aktif (1)',
            isActive: false,
            icon: Icons.bolt_rounded,
            iconColor: AppColors.alertAmber,
          ),
        ],
      ),
    );
  }

  Widget _buildChip({
    required String label,
    required bool isActive,
    IconData? icon,
    Color? iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? AppColors.darkNavy : AppColors.white,
        borderRadius: BorderRadius.circular(24),
        border: isActive ? null : Border.all(color: AppColors.dividerSlate),
        boxShadow: [
          if (!isActive)
            BoxShadow(
              color: AppColors.black.withOpacity(0.03),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: iconColor),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: isActive ? AppColors.white : AppColors.slate600,
            ),
          ),
        ],
      ),
    );
  }
}
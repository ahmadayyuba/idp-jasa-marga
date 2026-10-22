import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class LalinFilterBar extends StatelessWidget {
  const LalinFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Dropdown Ruas
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.dividerSlate),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Semua Ruas',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Icon(Icons.arrow_drop_down_rounded, color: AppColors.textSecondary),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),

        // Button Report Lalu Lintas
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.brightBlue),
          ),
          child: const Row(
            children: [
              Icon(Icons.description_outlined,
                  size: 16, color: AppColors.brightBlue),
              SizedBox(width: 6),
              Text(
                'Report Lalu Lintas',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.brightBlue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
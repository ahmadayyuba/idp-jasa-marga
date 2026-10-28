import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class MaintenanceKpiRow extends StatelessWidget {
  final int totalProyek;
  final int totalProses;
  final int totalSelesai;

  const MaintenanceKpiRow({
    super.key,
    required this.totalProyek,
    required this.totalProses,
    required this.totalSelesai,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildKpiCard(
            title: 'Total Proyek',
            value: '$totalProyek Titik',
            bgColor: AppColors.white,
            valueColor: AppColors.darkNavy,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildKpiCard(
            title: 'Proses',
            value: '$totalProses Titik',
            bgColor: AppColors.badgeAmberBg,
            valueColor: AppColors.warningAmber,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildKpiCard(
            title: 'Selesai',
            value: '$totalSelesai Titik',
            bgColor: AppColors.badgeGreenBg,
            valueColor: AppColors.statusGreen,
          ),
        ),
      ],
    );
  }

  Widget _buildKpiCard({
    required String title,
    required String value,
    required Color bgColor,
    required Color valueColor,
  }) {
    return Container(
      padding:  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.black.withOpacity(0.04)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          )
        ],
      ),
    );
  }
}

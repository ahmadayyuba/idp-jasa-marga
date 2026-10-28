import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class MaintenanceTaskCard extends StatelessWidget {
  final String title;
  final String statusLabel;
  final bool isCompleted;
  final String ruasName;
  final String locationDetail;
  final int progressPercent;
  final String pelaksana;
  final String targetDate;

  const MaintenanceTaskCard({
    super.key,
    required this.title,
    required this.statusLabel,
    required this.isCompleted,
    required this.ruasName,
    required this.locationDetail,
    required this.progressPercent,
    required this.pelaksana,
    required this.targetDate,
  });

  @override
  Widget build(BuildContext context) {
    final statusBgColor = isCompleted
        ? AppColors.badgeGreenBg
        : AppColors.badgeAmberBg;
    final statusTextColor = isCompleted
        ? AppColors.statusGreen
        : AppColors.warningAmber;
    final progressBarColor = isCompleted
        ? AppColors.statusGreen
        : AppColors.brightBlue;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkNavy,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  statusLabel,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: statusTextColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.cardLightBlue,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  ruasName,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blue700,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  locationDetail,
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.textSecondary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: progressPercent / 100,
                    minHeight: 8,
                    backgroundColor: AppColors.bgSlate,
                    valueColor: AlwaysStoppedAnimation<Color>(progressBarColor),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '$progressPercent',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: isCompleted
                      ? AppColors.statusGreen
                      : AppColors.darkNavy,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Pelakasana: $pelaksana',
                  style: const TextStyle(fontSize: 9, color: AppColors.textMuted),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                'Target: $targetDate',
                style: const TextStyle(fontSize: 9, color: AppColors.textMuted),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

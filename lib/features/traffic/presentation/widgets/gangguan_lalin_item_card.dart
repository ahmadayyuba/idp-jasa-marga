import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

enum GangguanStatus { dalamPenanganan, belumDitangani, selesai }

class GangguanLalinItemCard extends StatelessWidget {
  final String title;
  final String kmTag;
  final String description;
  final String timeText;
  final String impactText;
  final GangguanStatus status;

  const GangguanLalinItemCard({
    super.key,
    required this.title,
    required this.kmTag,
    required this.description,
    required this.timeText,
    this.impactText = 'Dampak: Lancar',
    required this.status,
  });

  Color get _statusBgColor {
    switch (status) {
      case GangguanStatus.dalamPenanganan:
        return AppColors.badgeYellowBg;
      case GangguanStatus.belumDitangani:
        return AppColors.badgeRoseBg;
      case GangguanStatus.selesai:
        return AppColors.forestGreen;
    }
  }

  Color get _statusTextColor {
    switch (status) {
      case GangguanStatus.dalamPenanganan:
        return AppColors.amberDark;
      case GangguanStatus.belumDitangani:
        return AppColors.crimsonRose;
      case GangguanStatus.selesai:
        return AppColors.forestGreen;
    }
  }

  String get _statusLabel {
    switch (status) {
      case GangguanStatus.dalamPenanganan:
        return 'Dalam Penanganan';
      case GangguanStatus.belumDitangani:
        return 'Belum Ditangani';
      case GangguanStatus.selesai:
        return 'Selesai';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkNavy,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.bgSlate,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        kmTag,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: AppColors.slate600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: _statusBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _statusLabel,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: _statusTextColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Icon(
                      Icons.car_crash_rounded,
                      size: 16,
                      color: AppColors.dangerRed,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        description,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.playerSurface,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                impactText,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.successGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          Row(
            children: [
              const Icon(Icons.access_time_rounded),
              const SizedBox(width: 6),
              Text(
                timeText,
                style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

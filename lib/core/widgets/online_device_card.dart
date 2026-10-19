import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class OnlineDeviceCard extends StatelessWidget {
  final String number;
  final String title;
  final String vendorName;
  final String statusText; // misal: "Connected" atau "Online"
  final String updateTimeText;

  const OnlineDeviceCard({
    super.key,
    required this.number,
    required this.title,
    required this.vendorName,
    required this.statusText,
    required this.updateTimeText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgSuccessSoft, // Latar hijau sangat pudar
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.successGreen.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Lingkaran Nomor (Hijau Solid)
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: AppColors.successGreen,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  number,
                  style: AppTextStyles.badgeText.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(width: 12),

              // Judul Alat
              Expanded(child: Text(title, style: AppTextStyles.itemTitle)),

              // Badge Status (Connected / Online)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.successGreen,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      size: 14,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      statusText,
                      style: AppTextStyles.badgeText.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Baris Bawah: Vendor & Waktu Update
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Badge Vendor abu-abu
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.bgBorderSoft,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Vendor: $vendorName',
                  style: AppTextStyles.bodySmall.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              // Waktu Update (Refresh Icon + Waktu)
              Row(
                children: [
                  Icon(Icons.refresh, size: 14, color: AppColors.textMuted),
                  const SizedBox(width: 4),
                  Text(updateTimeText, style: AppTextStyles.bodySmall),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

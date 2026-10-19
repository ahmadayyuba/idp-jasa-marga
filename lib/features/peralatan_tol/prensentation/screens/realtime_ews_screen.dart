import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/offline_device_card.dart';
import '../../../../core/widgets/online_device_card.dart';

class RealtimeEwsScreen extends StatelessWidget {
  const RealtimeEwsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Kita gunakan ListView agar layarnya bisa di-scroll
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // --- 1. KARTU HEADER & FILTER ---
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.bgBorderSoft),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'Realtime Data Peralatan EWS(Early Warning System)',
                      style: AppTextStyles.cardHeader,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.bgDangerSoft,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Total : 2',
                      style: AppTextStyles.badgeText.copyWith(
                        color: AppColors.dangerRed,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Dummy Filter (Nanti bisa diganti dropdown beneran)
              Row(
                children: [
                  Text('Region: ', style: AppTextStyles.bodySmall),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.bgBorderSoft),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Metropolitan', style: AppTextStyles.itemTitle),
                          Icon(Icons.keyboard_arrow_down, size: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // --- 2. DAFTAR PERANGKAT OFFLINE ---
        Text(
          'JANGER',
          style: AppTextStyles.itemGroupTitle.copyWith(
            color: AppColors.primaryBlue,
          ),
        ),
        const SizedBox(height: 8),
        const OfflineDeviceCard(
          number: '1',
          title: 'EWS Bitung KM 26+000 A',
          durationText: '5 Jam 6 Menit 16 Detik',
          offlineTimeText: '2026-09-02 08:30:10',
          indicatorColor: AppColors.warningOrange,
          durationBgColor: AppColors.bgWarningSoft,
        ),

        const SizedBox(height: 12),
        Text(
          'DALAM KOTA',
          style: AppTextStyles.itemGroupTitle.copyWith(
            color: AppColors.primaryBlue,
          ),
        ),
        const SizedBox(height: 8),
        const OfflineDeviceCard(
          number: '1',
          title: 'EWS Grogol KM 14+200 B',
          durationText: '3 Jam 20 Menit 41 Detik',
          offlineTimeText: '2026-09-02 10:15:45',
          indicatorColor: AppColors.warningOrange,
          durationBgColor: AppColors.bgWarningSoft,
        ),
        const SizedBox(height: 24),

        // --- 3. DAFTAR PERANGKAT ONLINE ---
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'EWS(Early Warning System) CONTROL',
              style: AppTextStyles.cardHeader,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.bgSuccessSoft,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '4 Unit Online',
                style: AppTextStyles.badgeText.copyWith(
                  color: AppColors.successGreen,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const OnlineDeviceCard(
          number: '1',
          title: 'KM 25+300B Sedyatmo',
          vendorName: 'AKM',
          statusText: 'Connected',
          updateTimeText: '2026-09-02 13:35:34',
        ),
        const OnlineDeviceCard(
          number: '2',
          title: 'KM 149+000A PBLY',
          vendorName: 'AKM',
          statusText: 'Connected',
          updateTimeText: '2026-09-02 13:35:34',
        ),
      ],
    );
  }
}

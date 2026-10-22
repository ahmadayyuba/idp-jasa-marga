import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/offline_device_card.dart';
import '../../../../core/widgets/online_device_card.dart';

class RealtimeSpeedcamScreen extends StatelessWidget {
  const RealtimeSpeedcamScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      'Realtime Data Peralatan SPEEDCAM',
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
                      'Total : 1',
                      style: AppTextStyles.badgeText.copyWith(
                        color: AppColors.cardRed,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('Region: ', style: AppTextStyles.bodySmall),
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

        // --- 2. DAFTAR PERANGKAT OFFLINE (WARNA MERAH) ---
        _buildGroupHeader('JORR E', '1'),
        const OfflineDeviceCard(
          number: '1',
          title: 'KM 48+100 B JORR',
          durationText: '7 Jam 36 Menit 39 Detik',
          offlineTimeText: '2026-09-02 05:59:38',
          indicatorColor: AppColors.cardRed,
          durationBgColor: AppColors.bgDangerSoft,
        ),
        const SizedBox(height: 16),

        // --- 3. KOTAK LEGEND DURASI OFFLINE ---
        _buildLegendBox(),
        const SizedBox(height: 24),

        // --- 4. DAFTAR PERANGKAT ONLINE ---
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('SPEEDCAM CONTROL', style: AppTextStyles.cardHeader),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.bgSuccessSoft,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '6 Unit Online',
                style: AppTextStyles.badgeText.copyWith(
                  color: AppColors.cardGreen,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const OnlineDeviceCard(
          number: '1',
          title: 'KM. 37+000 A Jagorawi',
          vendorName: 'AKM',
          statusText: 'Online',
          updateTimeText: '2026-09-02 13:36:09',
        ),
        const OnlineDeviceCard(
          number: '2',
          title: 'KM 21+500 A Sedyatmo',
          vendorName: 'AKM',
          statusText: 'Online',
          updateTimeText: '2026-09-02 13:36:09',
        ),
        const OnlineDeviceCard(
          number: '3',
          title: 'KM 611+300 B JNK',
          vendorName: 'AKM',
          statusText: 'Online',
          updateTimeText: '2026-09-02 13:36:09',
        ),
        const OnlineDeviceCard(
          number: '4',
          title: 'KM 611+300 A JNK',
          vendorName: 'AKM',
          statusText: 'Online',
          updateTimeText: '2026-09-02 13:36:09',
        ),
      ],
    );
  }

  // --- Widget Bantuan Internal ---
  Widget _buildGroupHeader(String title, String badgeCount) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyles.itemGroupTitle.copyWith(
              color: AppColors.primaryBlue,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: AppColors.bgDangerSoft,
              shape: BoxShape.circle,
            ),
            child: Text(
              badgeCount,
              style: AppTextStyles.badgeText.copyWith(
                color: AppColors.cardRed,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendBox() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.bgGraySoft,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Legend Durasi Offline:', style: AppTextStyles.formLabel),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              _legendItem(AppColors.legend1, '0 s/d 6 jam'),
              _legendItem(AppColors.legend2, '6+ s/d 12 jam'),
              _legendItem(AppColors.legend3, '12+ s/d 24 jam'),
              _legendItem(AppColors.legend4, '24+ jam s/d 3 hari'),
              _legendItem(AppColors.legend5, '>3 hari'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _legendItem(Color color, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(text, style: AppTextStyles.legendText),
      ],
    );
  }
}

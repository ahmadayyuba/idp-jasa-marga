import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class RealtimeCctvOffScreen extends StatelessWidget {
  const RealtimeCctvOffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // --- 1. HEADER & TOTAL UNIT OFF ---
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
                      'Realtime Data Peralatan CCTV (Off)',
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
                      'Total: 88 Unit Off',
                      style: AppTextStyles.badgeText.copyWith(
                        color: AppColors.cardRed,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Region Dropdown & Toggle Kartu/Tabel
              Row(
                children: [
                  const Text('Region:', style: AppTextStyles.bodySmall),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
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
                  const SizedBox(width: 12),
                  // Toggle Kartu | Tabel
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.bgGraySoft,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.bgBorderSoft),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlue,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: const Text(
                            'Kartu',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          child: Text(
                            'Tabel',
                            style: TextStyle(
                              color: AppColors.textMuted,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // --- 2. SUB-TAB (CCTV & CCTV Rest Area) ---
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(Icons.videocam, size: 16, color: Colors.white),
                  SizedBox(width: 6),
                  Text(
                    'CCTV',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.bgBorderSoft),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.local_gas_station,
                    size: 16,
                    color: AppColors.textMuted,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'CCTV Rest Area',
                    style: TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // --- 3. GRUP RUAS: JAKARTA-BOGOR-CIAWI ---
        _buildRuasGroupHeader(
          'Jakarta-Bogor-Ciawi',
          '4',
          '2026-09-02 13:26:56',
        ),
        const SizedBox(height: 8),

        // Item-item CCTV Off di dalam ruas ini
        _buildCctvOffCard(
          number: '1',
          title: 'JAGORAWI KM 27+400 | B',
          duration: '22 menit 6 detik',
          time: '2026-09-02 13:04:49',
        ),
        _buildCctvOffCard(
          number: '2',
          title: 'JAGORAWI Off Ramp BGR SLT [A]',
          duration: '39 menit 39 detik',
          time: '2026-09-02 12:47:17',
        ),
        _buildCctvOffCard(
          number: '3',
          title: 'JAGORAWI GT. Bogor Selatan',
          duration: '33 menit 19 detik',
          time: '2026-09-02 12:53:37',
        ),
        _buildCctvOffCard(
          number: '4',
          title: 'JAGORAWI KM 11+278 | OVERPA...',
          duration: '3 menit 33 detik',
          time: '2026-09-02 13:23:22',
        ),
      ],
    );
  }

  // Helper untuk Header Grup Ruas
  Widget _buildRuasGroupHeader(
    String ruasName,
    String countBadge,
    String timestamp,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              ruasName,
              style: AppTextStyles.itemGroupTitle.copyWith(
                color: AppColors.primaryBlue,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: AppColors.cardRed,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                countBadge,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Text(timestamp, style: AppTextStyles.bodySmall),
      ],
    );
  }

  // Helper untuk Kartu CCTV Off (Mirip OfflineDeviceCard tapi ada tombol Detail RTSP)
  Widget _buildCctvOffCard({
    required String number,
    required String title,
    required String duration,
    required String time,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.bgBorderSoft),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Garis kiri amber/kuning
              Container(
                width: 4,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.warningOrange,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 10),
              // Nomor lingkaran amber
              Container(
                width: 22,
                height: 22,
                decoration: const BoxDecoration(
                  color: AppColors.warningOrange,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  number,
                  style: AppTextStyles.badgeText.copyWith(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Judul CCTV
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.itemTitle.copyWith(fontSize: 12),
                ),
              ),
              // Badge Durasi Oranye
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.bgWarningSoft,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: AppColors.warningOrange.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  duration,
                  style: AppTextStyles.badgeText.copyWith(
                    color: AppColors.warningOrange,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Baris Bawah: Waktu & Tombol Detail RTSP
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 14),
                  const Icon(
                    Icons.access_time,
                    size: 12,
                    color: AppColors.textMuted,
                  ),
                  const SizedBox(width: 4),
                  Text(time, style: AppTextStyles.bodySmall),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.info_outline, size: 12, color: Colors.white),
                    SizedBox(width: 4),
                    Text(
                      'Detail RTSP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

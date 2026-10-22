import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class MonitoringSegmentHitScreen extends StatelessWidget {
  const MonitoringSegmentHitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // --- 1. KARTU FILTER SEGMENT HIT LALIN ---
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
              const Row(
                children: [
                  Icon(Icons.speed, color: AppColors.primaryBlue, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Filter Segment Hit Lalin',
                    style: AppTextStyles.cardHeader,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Dropdown Ruas (Lebar Penuh)
              _buildDropdownField('Filter Ruas', 'Pilih Ruas'),
              const SizedBox(height: 12),
              // Dropdown Sumber Data & Tipe (Sebaris)
              Row(
                children: [
                  Expanded(
                    child: _buildDropdownField(
                      'Filter Sumber Data',
                      'Pilih Sumber Data',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildDropdownField('Filter Tipe', 'Pilih Tipe'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Tombol Terapkan & Reset
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Terapkan',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.bgBorderSoft),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Reset',
                        style: TextStyle(
                          color: AppColors.textMuted,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // --- 2. HEADER DAFTAR MONITORING HIT ---
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Monitoring Hit Lalu Lintas',
                  style: AppTextStyles.cardHeader,
                ),
                const SizedBox(height: 2),
                Text(
                  '6 Segment Kecepatan Real-Time',
                  style: AppTextStyles.bodySmall,
                ),
              ],
            ),
            Row(
              children: [
                // Tombol Refresh
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryBlue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.refresh,
                        size: 14,
                        color: AppColors.primaryBlue,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Refresh',
                        style: TextStyle(
                          color: AppColors.primaryBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Toggle Grid/Table
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.grid_view,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.bgBorderSoft),
                  ),
                  child: const Icon(
                    Icons.table_chart,
                    color: AppColors.textMuted,
                    size: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),

        // --- 3. KARTU SEGMEN 1 ---
        _buildSegmentCard(
          number: '#1',
          sourceTag: 'JSM',
          typeTag: 'Radar',
          speedText: '64.0 Km/h',
          isSpeedFast: true,
          title: 'JUANDA - SS WARU',
          segmentType: 'Segment',
          jalur: 'B',
          radarName: 'JORR E KM 54+500 B',
        ),

        // --- 4. KARTU SEGMEN 2 ---
        _buildSegmentCard(
          number: '#2',
          sourceTag: 'JSM',
          typeTag: 'Radar',
          speedText: '64.7 Km/h',
          isSpeedFast: true,
          title: 'VSM KM 746+200 - SS WARU',
          segmentType: 'ETA Ruas DMS',
          jalur: 'B',
          radarName: 'JORR E KM 54+500 B',
        ),

        // --- 5. KARTU SEGMEN 3 (Kecepatan Lambat / Warna Merah) ---
        _buildSegmentCard(
          number: '#3',
          sourceTag: 'ARTERI',
          typeTag: 'Radar',
          speedText: '33.9 Km/h',
          isSpeedFast: false, // Menandakan kecepatan rendah (warna merah muda)
          title: 'ARTERI JOGYA SOLO …',
          segmentType: 'Segment',
          jalur: 'A',
          radarName: 'JOGJA KM 12+100 A',
        ),
      ],
    );
  }

  // Helper untuk kotak dropdown filter
  Widget _buildDropdownField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.bodySmall),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.bgGraySoft,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.bgBorderSoft),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                hint,
                style: TextStyle(color: AppColors.textMuted, fontSize: 12),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 16,
                color: AppColors.textMuted,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Helper untuk Kartu Segmen Hit Lalin
  Widget _buildSegmentCard({
    required String number,
    required String sourceTag,
    required String typeTag,
    required String speedText,
    required bool isSpeedFast,
    required String title,
    required String segmentType,
    required String jalur,
    required String radarName,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.bgBorderSoft),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Baris Atas: Badge Nomor, Sumber, Tipe & Kecepatan
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.bgGraySoft,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  number,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.bgGraySoft,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  sourceTag,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.iconBoxBg,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  typeTag,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isSpeedFast
                      ? AppColors.bgSuccessSoft
                      : AppColors.bgDangerSoft,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  speedText,
                  style: TextStyle(
                    color: isSpeedFast
                        ? AppColors.cardGreen
                        : AppColors.cardRed,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(title, style: AppTextStyles.cardHeader),
          const SizedBox(height: 12),

          // Kotak Detail Abu-abu (3 Kolom: Tipe, Jalur, Radar)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.bgGraySoft,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(child: _buildColumnInfo('Tipe', segmentType)),
                Expanded(child: _buildColumnInfo('Jalur', jalur)),
                Expanded(flex: 2, child: _buildColumnInfo('Radar', radarName)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper untuk kolom data di dalam kotak abu-abu
  Widget _buildColumnInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.bodySmall),
        const SizedBox(height: 2),
        Text(value, style: AppTextStyles.itemTitle.copyWith(fontSize: 11)),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class ManagementCctvScreen extends StatelessWidget {
  const ManagementCctvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // --- 1. KARTU FILTER 2x2 ---
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
                  Icon(Icons.tune, color: AppColors.primaryBlue, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Filter Management CCTV',
                    style: AppTextStyles.cardHeader,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Grid Filter 2x2
              Row(
                children: [
                  Expanded(
                    child: _buildDropdownField('Filter Ruas', 'Pilih Ruas'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildDropdownField('Filter Cabang', 'Pilih Cabang'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildDropdownField('Filter Area', 'Pilih Area'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildDropdownField(
                      'Filter Nama CCTV',
                      'Pilih Nama CCTV',
                    ),
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

        // --- 2. HEADER DAFTAR CCTV ---
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Daftar CCTV Terdaftar',
                  style: AppTextStyles.cardHeader,
                ),
                const SizedBox(height: 2),
                Text('4 Kamera Pemantau Aktif', style: AppTextStyles.bodySmall),
              ],
            ),
            Row(
              children: [
                // Tombol Export
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryBlue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.download_rounded,
                        size: 14,
                        color: AppColors.primaryBlue,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Export',
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
                // Toggle Grid/Table Icon
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

        // --- 3. KARTU DATA CCTV 1 ---
        _buildCctvCard(
          id: 'ID 14843',
          code: 'JJB',
          status: 'NORMAL',
          title: 'JJB Akses Ambarawa',
          ruasKm: 'Jogja - Bawen (KM 000+000)',
          area: 'SOLO-NGAWI',
          coordinate: '-7.2492555/110.4332957',
        ),

        // --- 4. KARTU DATA CCTV 2 ---
        _buildCctvCard(
          id: 'ID 14842',
          code: 'JJB',
          status: 'NORMAL',
          title: 'KM 444+400',
          ruasKm: 'Jogja - Bawen (KM 000+000)',
          area: 'SOLO-NGAWI',
          coordinate: '-7.248843943/110.418149',
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

  // Helper untuk Kartu Data CCTV
  Widget _buildCctvCard({
    required String id,
    required String code,
    required String status,
    required String title,
    required String ruasKm,
    required String area,
    required String coordinate,
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
          // Baris Atas: ID, Kode, dan Status Normal
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.bgGraySoft,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  id,
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
                  code,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                '● NORMAL ',
                style: TextStyle(
                  color: AppColors.cardGreen,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(
                Icons.info_outline,
                size: 14,
                color: AppColors.cardGreen,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(title, style: AppTextStyles.cardHeader),
          const SizedBox(height: 12),

          // Kotak Detail Abu-abu
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.bgGraySoft,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                _buildInfoRow('Ruas / KM', ruasKm),
                const SizedBox(height: 6),
                _buildInfoRow('Area', area),
                const SizedBox(height: 6),
                _buildInfoRow('Koordinat', coordinate),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper untuk baris key-value di dalam kotak abu-abu
  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 80, child: Text(label, style: AppTextStyles.bodySmall)),
        const Text(': ', style: TextStyle(color: AppColors.textMuted)),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.itemTitle.copyWith(fontSize: 12),
          ),
        ),
      ],
    );
  }
}

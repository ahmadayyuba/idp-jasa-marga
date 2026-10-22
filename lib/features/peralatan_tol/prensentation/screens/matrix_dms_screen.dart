import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class MatrixDmsScreen extends StatelessWidget {
  const MatrixDmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // --- 1. HEADER & FILTER KARTU ---
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
                  const Row(
                    children: [
                      Icon(
                        Icons.monitor,
                        color: AppColors.primaryBlue,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Matrix DMS (Dynamic Message Sign)',
                        style: AppTextStyles.cardHeader,
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.bgSuccessSoft,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '● 3 Unit Aktif',
                      style: AppTextStyles.badgeText.copyWith(
                        color: AppColors.cardGreen,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Dropdown Filter Sebaris
              Row(
                children: [
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
                          Text('Sedyatmo', style: AppTextStyles.itemTitle),
                          Icon(Icons.keyboard_arrow_down, size: 16),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
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
                          Text('All DMS', style: AppTextStyles.itemTitle),
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
        const SizedBox(height: 16),

        // --- 2. BANNER SIMULASI API ---
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.iconBoxBg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.primaryBlue.withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.cell_tower,
                color: AppColors.primaryBlue,
                size: 20,
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Data Live Display DMS diperbarui realtime dari controller NTCIP / API gateway.',
                  style: TextStyle(fontSize: 11, color: AppColors.primaryBlue),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Simulasi API',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // --- 3. KARTU DMS 1 (Gaya Teks Monospace + Bar Hijau) ---
        _buildDmsCard(
          location: 'CTC-29+850 B',
          slideInfo: 'Slide 1/2',
          lastUpdate: '2026-09-02 14:49:58',
          ledContent: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLedRow('KAMAL', '±6MN'),
              const SizedBox(height: 4),
              _buildLedRow('PLUIT', '±11MN'),
              const SizedBox(height: 4),
              _buildLedRow('SLIPI', '±17MN'),
            ],
          ),
        ),

        // --- 4. KARTU DMS 2 (Gaya Teks Putih Biasa) ---
        _buildDmsCard(
          location: 'OR ARTERI/JLB A',
          slideInfo: 'Slide 1/2',
          lastUpdate: '2026-09-02 14:49:58',
          ledContent: const Center(
            child: Text(
              'Melayani Sepenuh Hati',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'serif',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),

        // --- 5. KARTU DMS 3 (Gaya Peringatan Panjang) ---
        _buildDmsCard(
          location: 'OR PIK Ambon',
          slideInfo: 'Slide 1/2',
          lastUpdate: '2026-09-02 14:49:58',
          ledContent: const Center(
            child: Text(
              'KENDARAAN LEBIH BATAS DIMENSI\nDAN LEBIH BATAS MUATAN\nDILARANG MELINTAS DI JALAN TOL',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.amber,
                fontSize: 11,
                fontFamily: 'monospace',
                fontWeight: FontWeight.bold,
                height: 1.4,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // --- Widget Pembungkus Kartu DMS ---
  Widget _buildDmsCard({
    required String location,
    required String slideInfo,
    required String lastUpdate,
    required Widget ledContent,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.bgBorderSoft),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Kartu
          Row(
            children: [
              Text(location, style: AppTextStyles.cardHeader),
              const SizedBox(width: 6),
              const Icon(
                Icons.info_outline,
                color: AppColors.primaryBlue,
                size: 16,
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.bgGraySoft,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(slideInfo, style: AppTextStyles.bodySmall),
              ),
              const SizedBox(width: 8),
              Text('Last Update: $lastUpdate', style: AppTextStyles.bodySmall),
            ],
          ),
          const SizedBox(height: 12),

          // Layar LED Digital (Kotak Hitam dengan Bezel Gelap)
          Container(
            height: 110,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF0B0F19), // Hitam pekat ala papan LED
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.textDark, width: 3),
            ),
            alignment: Alignment.center,
            child: ledContent,
          ),
        ],
      ),
    );
  }

  // Helper untuk baris teks LED Monospace
  Widget _buildLedRow(String destination, String time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          destination,
          style: const TextStyle(
            color: Colors.amber,
            fontFamily: 'monospace',
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        Row(
          children: [
            Text(
              time,
              style: const TextStyle(
                color: Colors.amber,
                fontFamily: 'monospace',
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 16,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.wb_sunny, color: Colors.amber, size: 14),
          ],
        ),
      ],
    );
  }
}

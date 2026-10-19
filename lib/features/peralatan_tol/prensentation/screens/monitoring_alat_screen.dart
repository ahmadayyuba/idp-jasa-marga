import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class MonitoringAlatScreen extends StatelessWidget {
  const MonitoringAlatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // --- 1. TIGA KARTU STATISTIK ATAS ---
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                title: 'Total CCTV',
                value: '3867 Unit',
                subtitle: '100% Terpasang',
                textColor: AppColors.primaryBlue,
                bgColor: AppColors.iconBoxBg,
                icon: Icons.videocam,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildStatCard(
                title: 'CCTV Hidup',
                value: '3399 Unit',
                subtitle: '87.9% Aktif',
                textColor: AppColors.successGreen,
                bgColor: AppColors.bgSuccessSoft,
                icon: Icons.check_circle,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildStatCard(
                title: 'CCTV Mati',
                value: '468 Unit',
                subtitle: '12.1% Gangguan',
                textColor: AppColors.dangerRed,
                bgColor: AppColors.bgDangerSoft,
                icon: Icons.cancel,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // --- 2. KARTU GRAFIK MONITORING KONDISI CCTV ---
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
                  const Text(
                    'Monitoring Kondisi CCTV per Ruas',
                    style: AppTextStyles.cardHeader,
                  ),
                  Row(
                    children: [
                      _legendDot(AppColors.primaryBlue, 'Hidup'),
                      const SizedBox(width: 8),
                      _legendDot(AppColors.dangerRed, 'Mati'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Area Simulasi Bar Chart
              Container(
                height: 140,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.bgGraySoft,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  '[ Area Grafik Batang / Bar Chart ]',
                  style: TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Center(
                child: Text(
                  'Waktu update: 2026-09-02 13:26:23',
                  style: AppTextStyles.bodySmall,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // --- 3. KOLOM PENCARIAN & TOMBOL URUTKAN ---
        Row(
          children: [
            Expanded(
              child: Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.bgBorderSoft),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, size: 18, color: AppColors.textMuted),
                    SizedBox(width: 8),
                    Text(
                      'Cari Ruas...',
                      style: TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.bgBorderSoft),
              ),
              child: const Row(
                children: [
                  Icon(Icons.sort, size: 18, color: AppColors.primaryBlue),
                  SizedBox(width: 6),
                  Text(
                    'Urutkan Mati',
                    style: TextStyle(
                      color: AppColors.primaryBlue,
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

        // --- 4. DAFTAR RUAS JALAN ---
        _buildRuasCard(
          'Balikpapan-Samarinda',
          'Total: 99 Unit | Persentase Aktif: 100.0%',
          '99 ON',
          '0 OFF',
          false,
        ),
        _buildRuasCard(
          'Manado-Bitung',
          'Total: 53 Unit | Persentase Aktif: 98.1%',
          '52 ON',
          '1 OFF',
          true,
        ),
        _buildRuasCard(
          'Jakarta-Bogor-Ciawi',
          'Total: 183 Unit | Persentase Aktif: 97.8%',
          '179 ON',
          '4 OFF',
          true,
        ),
        _buildRuasCard(
          'Sedyatmo',
          'Total: 89 Unit | Persentase Aktif: 95.5%',
          '85 ON',
          '4 OFF',
          true,
        ),
      ],
    );
  }

  // Helper untuk Kartu Statistik Atas
  Widget _buildStatCard({
    required String title,
    required String value,
    required String subtitle,
    required Color textColor,
    required Color bgColor,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: textColor.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(icon, size: 16, color: textColor),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              color: textColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(color: AppColors.textMuted, fontSize: 9.5),
          ),
        ],
      ),
    );
  }

  // Helper untuk Legend Grafik
  Widget _legendDot(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 4),
        Text(text, style: AppTextStyles.bodySmall),
      ],
    );
  }

  // Helper untuk Kartu Daftar Ruas
  Widget _buildRuasCard(
    String ruasName,
    String detailText,
    String onText,
    String offText,
    bool hasOff,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.bgBorderSoft),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(ruasName, style: AppTextStyles.itemTitle),
                const SizedBox(height: 4),
                Text(detailText, style: AppTextStyles.bodySmall),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.iconBoxBg,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  onText,
                  style: TextStyle(
                    color: AppColors.primaryBlue,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: hasOff ? AppColors.bgDangerSoft : AppColors.bgGraySoft,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  offText,
                  style: TextStyle(
                    color: hasOff ? AppColors.dangerRed : AppColors.textMuted,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

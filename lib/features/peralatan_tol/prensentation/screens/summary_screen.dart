import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // --- 1. JUDUL PWO-RWGR KECIL DI ATAS KARTU ---
        const Text(
          'PWO-RWGR',
          style: TextStyle(
            color: AppColors.primaryBlue, // SUDAH BENAR
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),

        // --- 2. DUA KARTU STATISTIK UTAMA ATAS (Hijau & Merah Muda) ---
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: AppColors
                      .cardGreen, // --- REFAKTOR: Ganti Hardcode Hijau ---
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    // Lingkaran Putih dengan Icon Chart
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.bar_chart,
                        color: AppColors.cardGreen, // --- REFAKTOR: Ganti Hardcode Hijau ---
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Teks 70% dan PWO
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '70%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'PWO',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: AppColors
                      .cardRed, // --- REFAKTOR: Ganti Hardcode Merah ---
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    // Lingkaran Putih dengan Icon Chart
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.bar_chart,
                        color: AppColors
                            .cardRed, // --- REFAKTOR: Ganti Hardcode Merah ---
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Teks 5 (jam) dan RWGR
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '5 (jam)',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'RWGR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // --- 3. KARTU GRAFIK MONITORING PWO ---
        _buildChartCard(
          title: 'Grafik Monitoring PWO',
          filters: ['Metropolitan', 'Semua Ruas', 'CCTV'],
        ),
        const SizedBox(height: 16),

        // --- 4. KARTU GRAFIK MONITORING RWGR ---
        _buildChartCard(
          title: 'Grafik Monitoring RWGR',
          filters: ['Metropolitan', 'Semua Ruas', 'CCTV'],
        ),
      ],
    );
  }

  // Helper Kartu Grafik (Sudah Clean Code, tidak ada hardcode)
  Widget _buildChartCard({
    required String title,
    required List<String> filters,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.bgBorderSoft),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.cardHeader),
          const SizedBox(height: 12),
          // Baris Filter Dropdown Kecil
          Row(
            children: filters
                .map(
                  (f) => Expanded(
                    child: Container(
                      // 1. Kurangi margin antar kotak dari 8 menjadi 6
                      margin: EdgeInsets.only(right: f != filters.last ? 6 : 0),
                      // 2. Kurangi padding horizontal dari 10/8 menjadi 6
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.bgBorderSoft),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              f,
                              style: const TextStyle(
                                fontSize: 10, // 3. Turunkan font dari 11 ke 10 agar lebih aman
                                color: AppColors.textDark,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 2), // Jarak tipis teks ke ikon
                          const Icon(
                            Icons.keyboard_arrow_down,
                            size: 14, // 4. Turunkan ukuran ikon dari 16 ke 14
                            color: AppColors.textMuted,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 24),
          // Area Placeholder Grafik Garis (Line Chart Simulasi)
          Container(
            height: 180,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.bgGraySoft.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.bgBorderSoft),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.auto_graph, color: AppColors.primaryBlue, size: 32),
                SizedBox(height: 8),
                Text(
                  '[ Area Library Grafik Garis ]',
                  style: TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

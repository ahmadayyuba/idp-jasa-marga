import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class LalinBarChartCard extends StatelessWidget {
  final String title;
  final String updateTime;
  final List<Map<String, dynamic>> hourlyData;

  const LalinBarChartCard({
    super.key,
    required this.title,
    this.updateTime = '2026-08-27 10:10:08',
    required this.hourlyData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // 1. Badge Judul Gerbang
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.navyBlue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Subtitle
          const Text(
            'Total Kendaraan Per Jam',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            updateTime,
            style: const TextStyle(
              fontSize: 9,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 20),

          // 2. Chart Area dengan Y-Axis & Bars
          SizedBox(
            height: 180,
            child: Row(
              children: [
                // Sumbu Y (Scale Labels)
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('7500', style: TextStyle(fontSize: 8, color: AppColors.textMuted)),
                    Text('5500', style: TextStyle(fontSize: 8, color: AppColors.textMuted)),
                    Text('3500', style: TextStyle(fontSize: 8, color: AppColors.textMuted)),
                    Text('1500', style: TextStyle(fontSize: 8, color: AppColors.textMuted)),
                    Text('-500', style: TextStyle(fontSize: 8, color: AppColors.textMuted)),
                  ],
                ),
                const SizedBox(width: 8),

                // Area Grafik Batang Horizontal Scrollable / Flexible
                Expanded(
                  child: Stack(
                    children: [
                      // Grid Lines Horizontal Pasif
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          5,
                          (_) => const Divider(
                            height: 1,
                            thickness: 0.5,
                            color: AppColors.bgSlate,
                          ),
                        ),
                      ),

                      // Column Bars
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: hourlyData.map((item) {
                          final int count = item['count'] as int;
                          final String time = item['time'] as String;
                          final bool isHighlighted = item['isHighlighted'] ?? false;

                          // Tentukan Warna Berdasarkan Threshold Figma
                          Color barColor = AppColors.successGreen; // Hijau Normal
                          if (count >= 5500) {
                            barColor = AppColors.alertRed; // Merah Kritis (>5500)
                          } else if (count >= 3500) {
                            barColor = AppColors.alertAmber; // Kuning/Oranye Padat (>4000)
                          }

                          // Kalkulasi Tinggi Batang (max 7500)
                          final double heightRatio = (count / 7500).clamp(0.05, 1.0);

                          return Expanded(
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                // Background Highlight jam 12:00
                                if (isHighlighted)
                                  Container(
                                    width: 14,
                                    height: 180,
                                    color: AppColors.bgSlate,
                                  ),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // Angka di atas batang
                                    Text(
                                      '$count',
                                      style: TextStyle(
                                        fontSize: 6,
                                        fontWeight: isHighlighted
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: AppColors.slate700,
                                      ),
                                    ),
                                    const SizedBox(height: 2),

                                    // Batang Grafik
                                    Container(
                                      width: 8,
                                      height: 130 * heightRatio,
                                      decoration: BoxDecoration(
                                        color: barColor,
                                        borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(3),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 6),

                                    // Label Jam
                                    Text(
                                      time,
                                      style: TextStyle(
                                        fontSize: 7,
                                        fontWeight: isHighlighted
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: isHighlighted
                                            ? AppColors.navyBlue
                                            : AppColors.textMuted,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
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
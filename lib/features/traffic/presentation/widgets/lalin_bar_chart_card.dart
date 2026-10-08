import 'package:flutter/material.dart';

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
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
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
              color: const Color(0xFF002266),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
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
              color: Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            updateTime,
            style: const TextStyle(
              fontSize: 9,
              color: Color(0xFF94A3B8),
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
                    Text('7500', style: TextStyle(fontSize: 8, color: Color(0xFF94A3B8))),
                    Text('5500', style: TextStyle(fontSize: 8, color: Color(0xFF94A3B8))),
                    Text('3500', style: TextStyle(fontSize: 8, color: Color(0xFF94A3B8))),
                    Text('1500', style: TextStyle(fontSize: 8, color: Color(0xFF94A3B8))),
                    Text('-500', style: TextStyle(fontSize: 8, color: Color(0xFF94A3B8))),
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
                            color: Color(0xFFF1F5F9),
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
                          Color barColor = const Color(0xFF10B981); // Hijau Normal
                          if (count >= 5500) {
                            barColor = const Color(0xFFEF4444); // Merah Kritis (>5500)
                          } else if (count >= 3500) {
                            barColor = const Color(0xFFF59E0B); // Kuning/Oranye Padat (>4000)
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
                                    color: const Color(0xFFF1F5F9),
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
                                        color: const Color(0xFF334155),
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
                                            ? const Color(0xFF002266)
                                            : const Color(0xFF94A3B8),
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
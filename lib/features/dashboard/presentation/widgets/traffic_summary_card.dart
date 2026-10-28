import 'package:flutter/material.dart';

import 'traffic_detail_dialog.dart';
import '../../../../core/constants/app_colors.dart';

/// Enum untuk tipe status dampak lalu lintas
enum _DampakType { kepadatan, rekayasa, lancar, lancarTerkendali }

/// Model baris tabel traffic
class _TrafficRow {
  final String ruas;
  final String km;
  final String arah;
  final String dampak;
  final _DampakType dampakType;

  const _TrafficRow({
    required this.ruas,
    required this.km,
    required this.arah,
    required this.dampak,
    required this.dampakType,
  });
}

class TrafficSummaryCard extends StatefulWidget {
  const TrafficSummaryCard({super.key});

  @override
  State<TrafficSummaryCard> createState() => _TrafficSummaryCardState();
}

class _TrafficSummaryCardState extends State<TrafficSummaryCard> {
  int _selectedTabIndex = 0;

  final List<Map<String, dynamic>> _tabs = const [
    {'title': 'Gangguan\nLalu Lintas', 'icon': Icons.warning_amber_rounded},
    {'title': 'Rekayasa\nLalu Lintas', 'icon': Icons.alt_route_rounded},
    {'title': 'Pemeliharaan\nJalan Tol', 'icon': Icons.build_rounded},
  ];

  /// Data sample per tab
  final List<List<_TrafficRow>> _tabData = const [
    // Tab 0 – Gangguan Lalu Lintas
    [
      _TrafficRow(
        ruas: 'Jakarta - Cik...',
        km: '50+800',
        arah: 'Cikampek',
        dampak: 'Kepadatan +1KM',
        dampakType: _DampakType.kepadatan,
      ),
      _TrafficRow(
        ruas: 'Cipularang',
        km: '093+100',
        arah: 'Bandung',
        dampak: 'Lancar',
        dampakType: _DampakType.lancar,
      ),
      _TrafficRow(
        ruas: 'Jagorawi',
        km: '014+200',
        arah: 'Ciawi',
        dampak: 'Lancar Terkendali',
        dampakType: _DampakType.lancarTerkendali,
      ),
    ],
    // Tab 1 – Rekayasa Lalu Lintas
    [
      _TrafficRow(
        ruas: 'Cipali',
        km: '120+500',
        arah: 'Cirebon',
        dampak: 'Contraflow',
        dampakType: _DampakType.rekayasa,
      ),
      _TrafficRow(
        ruas: 'Tol Dalam Kota',
        km: '005+100',
        arah: 'Slipi',
        dampak: 'Lancar',
        dampakType: _DampakType.lancar,
      ),
    ],
    // Tab 2 – Pemeliharaan Jalan Tol
    [
      _TrafficRow(
        ruas: 'Jkt-Cikampek',
        km: '038+200',
        arah: 'Jakarta',
        dampak: 'Kepadatan +500M',
        dampakType: _DampakType.kepadatan,
      ),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    final rows = _tabData[_selectedTabIndex];

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.darkNavy, AppColors.accentBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.navyBlue.withValues(alpha: 0.35),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          // ── Tab Header ──────────────────────────────────────────
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.white10,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: List.generate(_tabs.length, (index) {
                final isSelected = _selectedTabIndex == index;
                final tabItem = _tabs[index];

                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedTabIndex = index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.white
                            : AppColors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      // 2. UBAH DI SINI: Gunakan Column agar Ikon berada di atas Teks
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            tabItem['icon'] as IconData,
                            size: 18,
                            color: isSelected
                                ? AppColors.primaryActive
                                : AppColors.white70,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            tabItem['title'] as String,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: isSelected
                                  ? AppColors.primaryActive
                                  : AppColors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 14),

          // ── Tabel Mini ──────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              children: [
                // Header kolom tabel
                const Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Ruas',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors.pastelBlue,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'KM',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors.pastelBlue,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Arah',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors.pastelBlue,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Dampak',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors.pastelBlue,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(height: 14, color: AppColors.white24),

                // Baris-baris data
                ...rows.map((row) => _buildTableRow(row)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow(_TrafficRow row) {
    final dampakColor = _dampakColor(row.dampakType);

    return InkWell(
      onTap: () => TrafficDetailDialog.show(context),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Row(
          children: [
            // Kolom Ruas
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline_rounded,
                    size: 13,
                    color: AppColors.skyBlueLight,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      row.ruas,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            // Kolom KM
            Expanded(
              flex: 2,
              child: Text(
                row.km,
                style: const TextStyle(fontSize: 10, color: AppColors.white70),
              ),
            ),
            // Kolom Arah
            Expanded(
              flex: 2,
              child: Text(
                row.arah,
                style: const TextStyle(fontSize: 10, color: AppColors.white70),
              ),
            ),
            // Kolom Dampak (berwarna berdasarkan tipe)
            Expanded(
              flex: 3,
              child: Text(
                row.dampak,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: dampakColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Tentukan warna teks dampak berdasarkan tipe
  Color _dampakColor(_DampakType type) {
    switch (type) {
      case _DampakType.kepadatan:
        return AppColors.alertOrange;
      case _DampakType.rekayasa:
        return AppColors.warningYellow;
      case _DampakType.lancarTerkendali:
        return AppColors.mintGreen;
      case _DampakType.lancar:
        return AppColors.successGreen;
    }
  }
}

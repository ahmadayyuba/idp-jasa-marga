import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class ReportStatusCctvScreen extends StatelessWidget {
  const ReportStatusCctvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // --- 1. KARTU FILTER REPORT STATUS CCTV ---
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
                  Icon(Icons.bar_chart, color: AppColors.primaryBlue, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Filter Report Status CCTV',
                    style: AppTextStyles.cardHeader,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Dropdown Ruas (Lebar Penuh)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Ruas', style: AppTextStyles.bodySmall),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.bgGraySoft,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.bgBorderSoft),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Dalam Kota', style: AppTextStyles.itemTitle),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 16,
                          color: AppColors.textMuted,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Filter Tanggal Dari & Sampai
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Dari', style: AppTextStyles.bodySmall),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 9,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.bgBorderSoft),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '09/02/2026',
                                style: AppTextStyles.itemTitle,
                              ),
                              Icon(
                                Icons.calendar_today_outlined,
                                size: 15,
                                color: AppColors.primaryBlue,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Sampai', style: AppTextStyles.bodySmall),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 9,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.bgBorderSoft),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '09/02/2026',
                                style: AppTextStyles.itemTitle,
                              ),
                              Icon(
                                Icons.calendar_today_outlined,
                                size: 15,
                                color: AppColors.primaryBlue,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Tombol Cari Laporan (Biru Lebar Penuh)
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Cari Laporan',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // --- 2. HEADER LAPORAN STATUS SHIFT ---
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Laporan Status Shift CCTV',
                  style: AppTextStyles.cardHeader,
                ),
                const SizedBox(height: 2),
                Text(
                  'Ruas Dalam Kota (09/02/2026)',
                  style: AppTextStyles.bodySmall,
                ),
              ],
            ),
            Row(
              children: [
                // Tombol Export
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

        // --- 3. KARTU LAPORAN SHIFT 1 ---
        _buildShiftReportCard(
          regionTag: 'Dalam Kota',
          statusText: 'OFFLINE',
          title: '(EWS) JTC KM 00+200 A',
          shift1Status: 'offline',
          shift2Status: 'stand by',
          shift3Status: 'stand by',
        ),

        // --- 4. KARTU LAPORAN SHIFT 2 ---
        _buildShiftReportCard(
          regionTag: 'Dalam Kota',
          statusText: 'OFFLINE',
          title: 'CCTV ANPR (JEMBATAN GELONG)',
          shift1Status: 'offline',
          shift2Status: 'stand by',
          shift3Status: 'stand by',
        ),
      ],
    );
  }

  // Helper untuk Kartu Laporan Shift CCTV
  Widget _buildShiftReportCard({
    required String regionTag,
    required String statusText,
    required String title,
    required String shift1Status,
    required String shift2Status,
    required String shift3Status,
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
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.iconBoxBg,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  regionTag,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.bgDangerSoft,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  statusText,
                  style: const TextStyle(
                    color: AppColors.dangerRed,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(title, style: AppTextStyles.cardHeader.copyWith(fontSize: 13)),
          const SizedBox(height: 12),

          // Kotak Detail Status Shift (3 Kolom: Pagi, Siang, Malam)
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.bgGraySoft,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _buildShiftColumn(
                    'Shift 1 (Pagi)',
                    shift1Status,
                    isDanger: true,
                  ),
                ),
                Expanded(
                  child: _buildShiftColumn(
                    'Shift 2 (Siang)',
                    shift2Status,
                    isDanger: false,
                  ),
                ),
                Expanded(
                  child: _buildShiftColumn(
                    'Shift 3 (Malam)',
                    shift3Status,
                    isDanger: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper untuk kolom shift di dalam kotak abu-abu
  Widget _buildShiftColumn(
    String shiftName,
    String statusValue, {
    required bool isDanger,
  }) {
    return Column(
      children: [
        Text(shiftName, style: AppTextStyles.bodySmall.copyWith(fontSize: 10)),
        const SizedBox(height: 4),
        Text(
          statusValue,
          style: TextStyle(
            color: isDanger ? AppColors.dangerRed : AppColors.textMuted,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class PwoRwgrScreen extends StatelessWidget {
  const PwoRwgrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // --- 1. KARTU FILTER PWO-RWGR ---
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
              // Row Dropdown Atas (Region & Ruas)
              Row(
                children: [
                  Expanded(child: _buildDropdownField('Metropolitan')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildDropdownField('Semua Ruas')),
                ],
              ),
              const SizedBox(height: 12),
              // Dropdown Jenis Alat (Lebar Penuh)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Jenis Alat', style: AppTextStyles.bodySmall),
                  const SizedBox(height: 4),
                  _buildDropdownField('CCTV', isFull: true),
                ],
              ),
              const SizedBox(height: 12),
              // Filter Tanggal Dari & Sampai
              Row(
                children: [
                  Expanded(child: _buildDateField('Dari', '03/07/2026')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildDateField('Sampai', '01/08/2026')),
                ],
              ),
              const SizedBox(height: 16),
              // Tombol Tampilkan (Biru Lebar Penuh)
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.accentBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search, color: Colors.white, size: 18),
                    SizedBox(width: 8),
                    Text(
                      'Tampilkan',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // --- 2. KOTAK RINGKASAN & TOMBOL EXPORT ---
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.bgGraySoft,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSummaryRow('Region', 'Metropolitan'),
                    _buildSummaryRow('Ruas', 'Semua Ruas'),
                    _buildSummaryRow('Tanggal', '2026-07-03 s/d 2026-08-01'),
                    _buildSummaryRow('Jenis Alat', 'CCTV'),
                  ],
                ),
              ),
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
                      color: AppColors.accentBlue,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Export',
                      style: TextStyle(
                        color: AppColors.accentBlue,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // --- 3. HEADER DAFTAR TELEMETRI ---
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Data Telemetri PWO-RWGR',
                    style: AppTextStyles.cardHeader,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '8 Titik Pemantauan Peralatan Tol',
                    style: AppTextStyles.bodySmall,
                  ),
                ],
              ),
            ),
            Row(
              children: [
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

        // --- 4. KARTU TELEMETRI 1 ---
        _buildTelemetryCard(
          number: '1',
          ruasTag: 'Semua Ruas',
          pwoPercentage: 'PWO 100.0%',
          title: 'JAGORAWI KM 14+000 || Tunnel Cibubur',
          wktHidup: '720j',
          wktMati: '0j',
          jmlHidup: '8497',
          rwgr: '40 Jam',
        ),

        // --- 5. KARTU TELEMETRI 2 ---
        _buildTelemetryCard(
          number: '2',
          ruasTag: 'Semua Ruas',
          pwoPercentage: 'PWO 100.0%',
          title: 'JAGORAWI KM 47+000 || Overpass Sentul',
          wktHidup: '720j',
          wktMati: '0j',
          jmlHidup: '8495',
          rwgr: '24 Jam',
        ),
      ],
    );
  }

  // Helper untuk kotak dropdown
  Widget _buildDropdownField(String text, {bool isFull = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.bgGraySoft,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.bgBorderSoft),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: AppTextStyles.itemTitle.copyWith(fontSize: 12)),
          const Icon(
            Icons.keyboard_arrow_down,
            size: 16,
            color: AppColors.textMuted,
          ),
        ],
      ),
    );
  }

  // Helper untuk input tanggal
  Widget _buildDateField(String label, String dateValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.bodySmall),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.bgBorderSoft),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dateValue,
                style: AppTextStyles.itemTitle.copyWith(fontSize: 12),
              ),
              const Icon(
                Icons.calendar_today_outlined,
                size: 15,
                color: AppColors.primaryBlue,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Helper untuk ringkasan teks
  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Text(
        '$label : $value',
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.textDark,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Helper untuk Kartu Telemetri
  Widget _buildTelemetryCard({
    required String number,
    required String ruasTag,
    required String pwoPercentage,
    required String title,
    required String wktHidup,
    required String wktMati,
    required String jmlHidup,
    required String rwgr,
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
          // Baris Atas: Nomor, Ruas Tag, & Persentase PWO Hijau
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
                  color: AppColors.iconBoxBg,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  ruasTag,
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
                  color: AppColors.bgSuccessSoft,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  pwoPercentage,
                  style: const TextStyle(
                    color: AppColors.cardGreen,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(title, style: AppTextStyles.cardHeader.copyWith(fontSize: 13)),
          const SizedBox(height: 12),

          // Kotak Detail Abu-abu (4 Kolom Metrik)
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.bgGraySoft,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _buildMetricItem(
                    'Wkt Hidup',
                    wktHidup,
                    AppColors.cardGreen,
                  ),
                ),
                Expanded(
                  child: _buildMetricItem(
                    'Wkt Mati',
                    wktMati,
                    AppColors.textMuted,
                  ),
                ),
                Expanded(
                  child: _buildMetricItem(
                    'Jml Hidup',
                    jmlHidup,
                    AppColors.primaryBlue,
                  ),
                ),
                Expanded(
                  child: _buildMetricItem(
                    'RWGR',
                    rwgr,
                    AppColors.warningPurple,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper untuk item metrik bawah
  Widget _buildMetricItem(String label, String value, Color valueColor) {
    return Column(
      children: [
        Text(label, style: AppTextStyles.bodySmall.copyWith(fontSize: 10)),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

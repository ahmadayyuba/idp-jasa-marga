import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class OfflineDeviceCard extends StatelessWidget {
  final String number; // Angka di dalam lingkaran (misal: "1")
  final String title; // Nama alat (misal: "EWS Bitung KM 26+000 A")
  final String durationText; // Teks durasi (misal: "5 Jam 6 Menit 16 Detik")
  final String offlineTimeText; // Waktu offline (misal: "2026-09-02 08:30:10")
  final Color
  indicatorColor; // Warna utama (kuning untuk EWS, merah untuk Radar)
  final Color
  durationBgColor; // Warna latar badge durasi (kuning pudar / merah pudar)

  // Analogi Web: Ini sama seperti mendefinisikan "props" di komponen React
  const OfflineDeviceCard({
    super.key,
    required this.number,
    required this.title,
    required this.durationText,
    required this.offlineTimeText,
    required this.indicatorColor,
    required this.durationBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12), // Jarak antar kartu
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.bgBorderSoft),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.02,
            ), // Bayangan sangat halus
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Garis vertikal di sebelah kiri
              Container(
                width: 4,
                height: 36,
                decoration: BoxDecoration(
                  color: indicatorColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 12),

              // 2. Lingkaran Nomor
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: indicatorColor,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  number,
                  style: AppTextStyles.badgeText.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(width: 12),

              // 3. Judul Alat (pakai Expanded biar teksnya bisa turun ke baris baru kalau kepanjangan)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 2,
                  ), // Biar sejajar dengan lingkaran
                  child: Text(title, style: AppTextStyles.itemTitle),
                ),
              ),
              const SizedBox(width: 8),

              // 4. Badge Durasi Offline
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: durationBgColor,
                  borderRadius: BorderRadius.circular(8),
                  // Border tipis senada dengan warna utama
                  border: Border.all(
                    color: indicatorColor.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  durationText,
                  style: AppTextStyles.badgeText.copyWith(
                    color: indicatorColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // 5. Baris Info Waktu Offline di bawah
          Row(
            children: [
              const SizedBox(
                width: 16,
              ), // Digeser supaya lurus dengan judul, bukan garis
              Icon(Icons.access_time, size: 14, color: AppColors.textMuted),
              const SizedBox(width: 6),
              Text(
                'Waktu Offline: $offlineTimeText',
                style: AppTextStyles.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

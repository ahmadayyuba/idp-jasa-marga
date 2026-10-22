import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  // Font Family standar (biasanya pakai Inter atau Plus Jakarta Sans, kita gunakan default-nya dulu)

  // 1. Judul Utama / Header Screen
  static const TextStyle screenTitle = TextStyle(
    fontSize: 20,
    fontWeight:
        FontWeight.w900, // <-- Ubah di sini jadi lebih tebal (w700 atau w800)
    color: AppColors.primaryBlue,
    letterSpacing: -0.3,
  );

  // 2. Judul Sub-Seksi / Header di dalam Card (misal: "Realtime Data Peralatan...")
  static const TextStyle cardHeader = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w800,
    color: AppColors.primaryBlue,
  );

  // 3. Nama Lokasi / Bold Title di dalam daftar (misal: "JANGER", "DALAM KOTA")
  static const TextStyle itemGroupTitle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  // 4. Detail Item (misal: "EWS Bitung KM 26+000 A")
  static const TextStyle itemTitle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  // 5. Deskripsi / Info di bawah (misal: "Waktu Offline: ...", "Vendor: ...")
  static const TextStyle bodySmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.normal,
    color: AppColors.textMuted,
  );

  // 6. Badge & Counter Kecil (misal: "Total: 2", offline timer, status)
  static const TextStyle badgeText = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
  );

  // 7. Stat Card Label & Angka (Dashboard Summary)
  static const TextStyle statValue = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle statLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  // 8. Form Label / Legend Text
  static const TextStyle formLabel = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.bold,
    color: AppColors.textMuted,
  );

  static const TextStyle legendText = TextStyle(
    fontSize: 9.5,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );
}

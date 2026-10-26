import 'package:flutter/material.dart';

class AppColors {
  // === Warna Utama Brand Jasa Marga & Accent (Bawaan Teman) ===
  static const Color primaryBlue = Color(0xFF250094);
  static const Color accentBlue = Color(0xFF3B82F6);
  static const Color buttonGradientEnd = Color(0xFFE2F0FD);

  // === Warna Teks (Bawaan Teman) ===
  static const Color textDark = Color(0xFF0F172A);
  static const Color textMuted = Color(0xFF64748B);

  // === Warna Latar Belakang & Container (Bawaan Teman) ===
  static const Color backgroundCard = Color(0xFFF8FAFC);
  static const Color iconBoxBg = Color(0xFFEEF2FF);

  // =======================================================
  // === Penambahan Baru: Untuk Kebutuhan Visual UI Slicing ===
  // =======================================================

  // Status Dasar & Kartu Ringkasan
  static const Color cardGreen = Color(0xFF22C55E); // Green Emerald
  static const Color cardRed = Color(0xFFF85D5D);   // Soft Coral Red

  static const Color warningOrange = Color(
    0xFFF59E0B,
  ); // Amber/Oranye (EWS/legend 0-6 jam)
  static const Color warningPurple = Color(
    0xFF8B5CF6,
  ); // Ungu untuk metric RWGR 40 Jam

  // Variasi Soft Background (Untuk Badge, Timer & Durasi)
  static const Color bgSuccessSoft = Color(
    0xFFECFDF5,
  ); // Hijau Sangat Muda (Connected / Online)
  static const Color bgDangerSoft = Color(
    0xFFFEE2E2,
  ); // Pink/Merah Sangat Muda (offline legend/Total unit)
  static const Color bgWarningSoft = Color(
    0xFFFEF3C7,
  ); // Oranye Sangat Muda (durasi 0-6 jam)
  static const Color bgBorderSoft = Color(
    0xFFE2E8F0,
  ); // Border abu-abu halus untuk card/dropdown
  static const Color bgGraySoft = Color(
    0xFFF1F5F9,
  ); // Background abu-abu tipis (standby/input)

  // Legend Durasi Offline (image_0, image_1, image_2)
  static const Color legend1 = Color(0xFFF59E0B); // Yellow/Orange
  static const Color legend2 = Color(0xFFEF4444); // Red (6-12 jam)
  static const Color legend3 = Color(0xFFDC2626); // Dark Red (12-24 jam)
  static const Color legend4 = Color(0xFF991B1B); // Maroon (24 jam - 3 hari)
  static const Color legend5 = Color(0xFF7F1D1D); // Deep Red (>3 hari)

  // Latar belakang gradasi layar
  static const Color bgGradientStart = Color(
    0xFFE0F2FE,
  ); // Biru muda bagian atas layar
  static const Color bgGradientEnd = Colors.white; // Putih ke bawah
}

import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class MatrixCctvScreen extends StatelessWidget {
  const MatrixCctvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // --- 1. HEADER NAVIGASI SEGMENT ---
        const Row(
          children: [
            Icon(Icons.arrow_back_ios, size: 14, color: AppColors.primaryBlue),
            SizedBox(width: 4),
            Text('Segment', style: AppTextStyles.bodySmall),
          ],
        ),
        const SizedBox(height: 4),
        const Text('Semua Segment', style: AppTextStyles.cardHeader),
        const SizedBox(height: 16),

        // --- 2. KARTU CCTV UTAMA (FEATURED VIEW) ---
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(
              0xFF1B233A,
            ), // Warna biru dongker gelap khas CCTV
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.bgBorderSoft),
          ),
          child: Stack(
            children: [
              // Gambar Placeholder Jalur (Bisa diganti Image.network nanti)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.videocam_off,
                      color: Colors.white.withValues(alpha: 0.3),
                      size: 40,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Live Streaming Area',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.5),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              // Overlay Atas: Judul, Waktu, & Badge Jasa Marga
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.7),
                        Colors.transparent,
                      ],
                    ),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          '01+600 Cililitan [LIVE] 2026-08-27 06:30:15',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryBlue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'JASA MARGA',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Overlay Kiri Bawah: Indikator Panah (Misal: ^ CAWANG)
              const Positioned(
                bottom: 16,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_upward, color: Colors.white, size: 16),
                    SizedBox(height: 2),
                    Text(
                      'CAWANG',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // --- 3. TEKS LOKASI ---
        const Text('Lokasi', style: AppTextStyles.bodySmall),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(
              Icons.location_on,
              color: AppColors.primaryBlue,
              size: 20,
            ),
            const SizedBox(width: 6),
            Text(
              'KM 00+400 | CAWANG - CILILITAN',
              style: AppTextStyles.cardHeader.copyWith(fontSize: 15),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // --- 4. GRID CCTV KECIL (2x2) ---
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(), // Supaya GridView tidak memiliki scroll sendiri
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio:
              1.2, // Mengatur rasio lebar:tinggi kartu agar tidak terlalu kotak
          children: [
            _buildGridCctvCard('SS KM 00+400', 'CAWANG - CILILITAN'),
            _buildGridCctvCard('SS CKM 00+400', 'GERBANG TOL CILILITAN'),
            _buildGridCctvCard('SS KM 03+200', 'SIMPANG SUSUN TEBET'),
            _buildGridCctvCard('SS KM 08+100', 'GERBANG TOL TMII'),
          ],
        ),
        // Tambahan jarak kosong di bawah untuk tempat mengambang floating button peta
        const SizedBox(height: 80),
      ],
    );
  }

  // Helper untuk Kartu Grid CCTV
  Widget _buildGridCctvCard(String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1B233A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // Gambar / Icon Background
          Center(
            child: Icon(
              Icons.camera_alt,
              color: Colors.white.withValues(alpha: 0.2),
              size: 30,
            ),
          ),
          // Badge "LIVE" di Kanan Atas
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
              ),
              child: const Text(
                'LIVE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Footer Teks (Warna Gelap Transparan di Bawah)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

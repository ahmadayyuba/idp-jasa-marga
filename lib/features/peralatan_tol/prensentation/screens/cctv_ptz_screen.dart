import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class CctvPtzScreen extends StatelessWidget {
  const CctvPtzScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // --- 1. HEADER FILTER (Ruas, Show, Fullscreen) ---
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.bgBorderSoft),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jakarta-Cikampek',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: AppColors.textMuted,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Show',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.bgBorderSoft),
              ),
              child: const Icon(Icons.fullscreen, color: AppColors.primaryBlue),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // --- 2. KARTU CCTV PTZ UTAMA & KONTROL ---
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.bgBorderSoft),
          ),
          child: Column(
            children: [
              // Area Video Player / Gambar Placeholder
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  color: Color(0xFFE5E9F2),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.videocam,
                            size: 40,
                            color: AppColors.primaryBlue.withValues(alpha: 0.3),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Jasa Marga Integrated Digitalmap',
                            style: TextStyle(
                              color: AppColors.primaryBlue.withValues(
                                alpha: 0.5,
                              ),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'CIKAMPEK KM 71+650 B',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryBlue,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'travoy',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          '02 Sep 2026  13:26:52',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Area Detail Info & D-Pad Kontrol
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'CIKAMPEK KM 71+650 B',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: AppColors.primaryBlue,
                            ), // Font ditebalkan dan biru
                          ),
                          const SizedBox(height: 12),
                          _buildDetailRow('Ruas', ': JAPEK'),
                          _buildDetailRow('KM', ': 071+650'),
                          _buildDetailRow(
                            'Latitude/ Longitude',
                            ': 3.5622936/\n  98.8527017',
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.bgSuccessSoft,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 8,
                                  color: AppColors.successGreen,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  'ONLINE 1080P PTZ ACTIVE',
                                  style: TextStyle(
                                    color: AppColors.successGreen,
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
                    // Kanan: D-Pad Camera Control
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.bgGraySoft,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.bgBorderSoft),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Camera Control',
                            style: TextStyle(
                              fontSize: 11,
                              color: AppColors.textDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildControlButton(Icons.arrow_upward),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              _buildControlButton(Icons.arrow_back),
                              const SizedBox(width: 4),
                              _buildControlButton(Icons.adjust, isCenter: true),
                              const SizedBox(width: 4),
                              _buildControlButton(Icons.arrow_forward),
                            ],
                          ),
                          const SizedBox(height: 4),
                          _buildControlButton(Icons.arrow_downward),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              _buildControlButton(Icons.add),
                              const SizedBox(width: 8),
                              _buildControlButton(Icons.remove),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // --- 3. DAFTAR KAMERA PTZ TERSEDIA ---
        const Text(
          'Pilih Kamera PTZ Tersedia',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: AppColors.textDark,
          ), // Font ditebalkan
        ),
        const SizedBox(height: 12),

        _buildCameraListItem(
          title: 'CIKAMPEK KM 71+650 B',
          subtitle: 'KM 071+650 | JAPEK',
          isActive: true,
        ),
        _buildCameraListItem(
          title: 'CIKAMPEK SURV SS DAWUAN',
          subtitle: 'KM 068+400 | JAPEK',
          isActive: false,
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // HELPER DIPERBARUI: Bentuk kotak membulat (bukan lingkaran), sesuai referensi.
  Widget _buildControlButton(IconData icon, {bool isCenter = false}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          8,
        ), // Diubah dari BoxShape.circle ke BorderRadius
        border: Border.all(color: AppColors.bgBorderSoft),
      ),
      child: Icon(
        icon,
        size: 18,
        color: isCenter ? AppColors.primaryBlue : AppColors.textDark,
      ),
    );
  }

  // HELPER DIPERBARUI: Ikon control_camera dan font tebal
  Widget _buildCameraListItem({
    required String title,
    required String subtitle,
    required bool isActive,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primaryBlue.withValues(alpha: 0.05)
            : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isActive ? AppColors.primaryBlue : AppColors.bgBorderSoft,
          width: isActive ? 1.5 : 1.0,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isActive ? AppColors.primaryBlue : AppColors.bgGraySoft,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.control_camera, // Ikon panah empat arah
              color: isActive ? Colors.white : AppColors.textMuted,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: isActive
                        ? AppColors.primaryBlue
                        : AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          if (isActive)
            const Icon(
              Icons.check_circle,
              color: AppColors.primaryBlue,
            ), // Icon centang biru
        ],
      ),
    );
  }
}

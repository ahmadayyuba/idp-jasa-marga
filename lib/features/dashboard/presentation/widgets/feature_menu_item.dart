import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class FeatureMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor; // 1. Tambahkan parameter warna di sini

  const FeatureMenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor, // 2. Masukkan ke constructor
  });

  @override
  Widget build(BuildContext context) {
    // 3. Tentukan warna aktif (jika iconColor kosong, pakai default primaryActive)
    final activeColor = iconColor ?? AppColors.primaryActive;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              // 4. Background lingkaran otomatis mengikuti warna ikon (transparansi 12%)
              color: activeColor.withValues(alpha: 0.12),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: activeColor.withValues(alpha: 0.10),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: activeColor,
              size: 26,
            ), // 5. Warna ikon dinamis
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: AppColors.playerSurface,
            ),
          ),
        ],
      ),
    );
  }
}

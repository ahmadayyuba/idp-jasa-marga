import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class KinerjaRuasCard extends StatelessWidget {
  final String ruasTitle;
  final double vcRatio;
  final String losText;
  final String speedText;

  const KinerjaRuasCard({
    super.key,
    required this.ruasTitle,
    required this.vcRatio,
    required this.losText,
    required this.speedText,
  });

  // Penentuan warna badge berdasarkan nilai V/C Ratio
  Color get _vcBgColor {
    if (vcRatio >= 0.80) {
      return AppColors.badgeRedBg; // Merah Muda
    } else if (vcRatio >= 0.65) {
      return AppColors.badgeAmberBg; // Kuning / Krem
    } else {
      return AppColors.badgeGreenBg; // Hijau Muda
    }
  }

  Color get _vcTextColor {
    if (vcRatio >= 0.80) {
      return AppColors.dangerRed; // Merah
    } else if (vcRatio >= 0.65) {
      return AppColors.warningAmber; // Oranye/Kuning
    } else {
      return AppColors.statusGreen; // Hijau
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Nama Ruas & Badge V/C
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  ruasTitle,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkNavy,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: _vcBgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'V/C: ${vcRatio.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: _vcTextColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Bottom Row: LOS Status & Kecepatan
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                losText,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: _vcTextColor,
                ),
              ),
              Row(
                children: [
                  const Text(
                    'Kec: ',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    speedText,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryActive,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
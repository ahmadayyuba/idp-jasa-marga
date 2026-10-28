import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class RekayasaTrafficCard extends StatelessWidget {
  const RekayasaTrafficCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Data Rekayasa Lalu Lintas',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryActive,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _buildCard(
              bgColor: AppColors.successGreen, // Hijau Oneway
              icon: Icons.alt_route_rounded,
              value: '1057',
              label: 'Oneway',
            ),
            const SizedBox(width: 10),
            _buildCard(
              bgColor: AppColors.purpleContraflow, // Ungu Contraflow
              icon: Icons.traffic_rounded,
              value: '139',
              label: 'Contraflow',
            ),
            const SizedBox(width: 10),
            _buildCard(
              bgColor: AppColors.alertOrange, // Oranye Pengalihan
              icon: Icons.signpost_rounded,
              value: '270',
              label: 'Pengalihan',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCard({
    required Color bgColor,
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        height: 100,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: AppColors.white, size: 22),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.white70,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
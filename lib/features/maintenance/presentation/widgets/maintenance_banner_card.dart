import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class MaintenanceBannerCard extends StatelessWidget {
  const MaintenanceBannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primaryActive, AppColors.brightBlue],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
            color: AppColors.primaryActive.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
            ),
          ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.engineering_rounded,
              color:  AppColors.white,
              size: 28,
            ),
          ),
          const SizedBox(width: 24),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Data Pemeliharaan Tol',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Monitoring real-time pekerjaan fisik jalan tol',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.white70,
                  ),
                )
              ],
            ),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class MaintenanceHeader extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onRefreshTap;

  const MaintenanceHeader({
    super.key,
    required this.onBack,
    this.onNotificationTap,
    this.onRefreshTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onBack,
          borderRadius: BorderRadius.circular(12),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
              color: AppColors.darkNavy,
            ),
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'Pemeliharaan',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.darkNavy,
          ),
        ),
        const Spacer(),
        // Notification Bell with Badge
        Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: AppColors.darkNavy,
                  size: 20,
                ),
                onPressed: onNotificationTap ?? () {},
              ),
            ),
            Positioned(
              right: 12,
              top: 12,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.alertRed,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.refresh_rounded,
              color: AppColors.darkNavy,
              size: 20,
            ),
            onPressed: onRefreshTap ?? () {},
          ),
        ),
      ],
    );
  }
}
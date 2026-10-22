import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class CctvActionButtons extends StatelessWidget {
  final VoidCallback? onNotificationTap;
  final VoidCallback? onRefreshTap;

  const CctvActionButtons({
    super.key,
    this.onNotificationTap,
    this.onRefreshTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
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
                decoration: BoxDecoration(
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

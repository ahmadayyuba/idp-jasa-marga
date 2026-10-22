import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class HeaderProfileSection extends StatelessWidget {
  final String userName;
  final VoidCallback onNotificationTap;
  final VoidCallback onFilterTap;
  final VoidCallback onLogoutTap;

  const HeaderProfileSection({
    super.key,
    required this.userName,
    required this.onNotificationTap,
    required this.onFilterTap,
    required this.onLogoutTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.avatarLightBlue,
          child: const Text(
            'A',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryActive,
            ),
          ),
        ),
        const SizedBox(width: 12),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Halo',
              style: TextStyle(fontSize: 12, color: AppColors.grey),
            ),
            Text(
              userName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.playerSurface,
              ),
            ),
          ],
        ),
        const Spacer(),


        // Action Buttons
        _buildIconButton(
          icon: Icons.notifications_none_rounded,
          onTap: onNotificationTap,
          showBadge: true,
        ),
        const SizedBox(width: 8),
        _buildIconButton(
          icon: Icons.tune_rounded,
          onTap: onFilterTap,
        ),
        const SizedBox(width: 8),
        _buildIconButton(
          icon: Icons.power_settings_new_rounded,
          onTap: onLogoutTap,
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onTap,
    bool showBadge = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.8),
          shape: BoxShape.circle,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(icon, color: AppColors.primaryActive, size: 20),
            if(showBadge)
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                ),
          ],
        ),
      ),
    );
  }
}

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

  /// Ambil inisial pertama dari nama user
  String get _initial =>
      userName.trim().isNotEmpty ? userName.trim()[0].toUpperCase() : 'U';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Avatar circle dengan inisial dinamis
        CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.avatarLightBlue,
          child: Text(
            _initial,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryActive,
            ),
          ),
        ),
        const SizedBox(width: 12),

        // Greeting + nama user
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Halo,',
              style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
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
            if (showBadge)
              Positioned(
                top: 10,
                right: 10,
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
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HeaderProfileSection extends StatelessWidget {
  final String username;
  final VoidCallback onNotificationTap;
  final VoidCallback onFilterTap;
  final VoidCallback onLogoutTap;

  const HeaderProfileSection({
    super.key,
    required this.username,
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
          backgroundColor: const Color(0xFFE2EDF8),
          child: const Text(
            'A',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF003399),
            ),
          ),
        ),
        const SizedBox(width: 12),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Halo',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Text(
              username,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
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
          color: Colors.white.withOpacity(0.8),
          shape: BoxShape.circle,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(icon, color: const Color(0xFF003399), size: 20),
            if(showBadge)
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
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

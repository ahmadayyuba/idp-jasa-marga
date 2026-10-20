import 'package:flutter/material.dart';

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
              color: Color(0xFF0F2B5B),
            ),
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'Pemeliharaan',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F2B5B),
          ),
        ),
        const Spacer(),
        // Notification Bell with Badge
        Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Color(0xFF0F2B5B),
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
                  color: Color(0xFFEF4444),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.refresh_rounded,
              color: Color(0xFF0F2B5B),
              size: 20,
            ),
            onPressed: onRefreshTap ?? () {},
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';

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
                decoration: BoxDecoration(
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

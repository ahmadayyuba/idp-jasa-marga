import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/session/auth_session_manager.dart';
import '../../data/models/user_model.dart';

class CctvHeader extends StatelessWidget {
  const CctvHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<UserModel?>(
      valueListenable: AuthSessionManager.instance.currentUserNotifier,
      builder: (context, user, _) {
        final displayName = user?.fullName ?? 'Rahmat Rudiantono';
        final initial = displayName.isNotEmpty ? displayName[0].toUpperCase() : 'R';

        return Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: AppColors.avatarBg, // Biru pucat
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                initial,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlue,
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Teks Sapaan
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Halo',
                    style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
                  ),
                  Text(
                    '$displayName!',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Tombol Notifikasi
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
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.alertRed, // Merah
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),

            // Tombol Refresh
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
                onPressed: () {},
              ),
            ),
          ],
        );
      },
    );
  }
}

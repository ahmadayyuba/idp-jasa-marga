import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';

class SettingsLogoutButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SettingsLogoutButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.redSurfaceLight,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderRedLight, width: 1.5),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.power_settings_new_rounded,
              color: AppColors.alertRed,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              'Keluar (Logout)',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.alertRed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

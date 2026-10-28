import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class FooterBadge extends StatelessWidget {
  const FooterBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.verified_user_outlined, color: AppColors.white70, size: 14),
          SizedBox(width: 6),
          Text(
            '© 2018 - 2026 PT Jasa Marga (Persero) Tbk',
            style: TextStyle(
              color: AppColors.white70,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

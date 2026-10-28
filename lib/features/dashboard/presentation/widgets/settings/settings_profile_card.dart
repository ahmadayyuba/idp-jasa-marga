import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';

class SettingsProfileCard extends StatelessWidget {
  final String name;
  final String role;
  final String employeeId;

  const SettingsProfileCard({
    super.key,
    required this.name,
    required this.role,
    required this.employeeId,
  });

  @override
  Widget build(BuildContext context) {
    final String initialLetter = name.isNotEmpty ? name[0].toUpperCase() : 'A';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color:  AppColors.dividerSlate, width: 1.5),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.primaryActive,
            child: Text(
              initialLetter,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                Text(
                  '(role • ID)employeeId',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

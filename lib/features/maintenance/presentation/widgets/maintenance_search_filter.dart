import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class MaintenanceSearchFilter extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback onFilterTap;

  const MaintenanceSearchFilter({
    super.key,
    required this.searchController,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.dividerSlate),
            ),
            child: TextField(
              controller: searchController,
              style: const TextStyle(fontSize: 12, color: AppColors.textPrimary),
              decoration: const InputDecoration(
                hintText: 'Cari ruas / KM...',
                hintStyle: TextStyle(fontSize: 12, color: AppColors.textMuted),
                prefixIcon: Icon(Icons.search_rounded, size: 18, color: AppColors.textMuted),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton.icon(
          onPressed: onFilterTap,
          icon: const Icon(Icons.tune_rounded, size: 16, color: AppColors.white),
          label: const Text(
            'Filter',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryActive,
            elevation: 0,
            minimumSize: const Size(0, 44),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class ManagementLcsFilterCard extends StatefulWidget {
  final int totalTitik;

  const ManagementLcsFilterCard({super.key, this.totalTitik = 6});

  @override
  State<ManagementLcsFilterCard> createState() =>
      _ManagementLcsFilterCardState();
}

class _ManagementLcsFilterCardState extends State<ManagementLcsFilterCard> {
  String _selectedRuas = 'Jakarta-Cikampek';
  int _viewMode = 0; // 0 = Kartu, 1 = Tabel

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Title + Total Titik Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.alt_route_rounded,
                    size: 18,
                    color: AppColors.primaryActive,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Management LCS (Lane Control Sign)',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkNavy,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.badgeGreenBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${widget.totalTitik} Titik LCS',
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: AppColors.statusGreen,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Dropdown Ruas
          const Text(
            'Ruas',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.dividerSlate),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedRuas,
                isExpanded: true,
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 18,
                  color: AppColors.textSecondary,
                ),
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
                onChanged: (val) => setState(() => _selectedRuas = val!),
                items: ['Jakarta-Cikampek', 'Jagorawi', 'Cipularang'].map((e) {
                  return DropdownMenuItem<String>(value: e, child: Text(e));
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Search Field & Segmented View Toggle
          Row(
            children: [
              // Search Field
              Expanded(
                child: Container(
                  height: 38,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColors.bgGradientEnd,
                    border: Border.all(color: AppColors.dividerSlate),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.search_rounded,
                        size: 16,
                        color: AppColors.textMuted,
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: TextField(
                          style: TextStyle(fontSize: 11),
                          decoration: InputDecoration(
                            hintText: 'Cari berdasarkan nama lokas...',
                            hintStyle: TextStyle(
                              fontSize: 11,
                              color: AppColors.textMuted,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),

              // Segmented Toggle: Kartu / Tabel
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: AppColors.bgSlate,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    _buildViewTab(Icons.segment_rounded, 'Kartu', 0),
                    _buildViewTab(Icons.table_chart_rounded, 'Tabel', 1),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildViewTab(IconData icon, String label, int index) {
    final isSelected = _viewMode == index;
    return GestureDetector(
      onTap: () => setState(() => _viewMode = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryActive : AppColors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 12,
              color: isSelected ? AppColors.white : AppColors.textSecondary,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: isSelected ? AppColors.white : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

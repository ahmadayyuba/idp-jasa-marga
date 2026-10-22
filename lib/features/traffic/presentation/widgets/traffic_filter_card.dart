import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class TrafficFilterCard extends StatefulWidget {
  final VoidCallback? onApply;

  const TrafficFilterCard({super.key, this.onApply});

  @override
  State<TrafficFilterCard> createState() => _TrafficFilterCardState();
}

class _TrafficFilterCardState extends State<TrafficFilterCard> {
  String _selectedRegion = 'Metropolitan';
  String _selectedRuas = 'Dalam Kota';
  String _selectedJalur = 'CAWANG - CENGKARENG';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Filter
          const Row(
            children: [
              Icon(Icons.traffic_rounded, size: 18, color: AppColors.primaryActive),
              SizedBox(width: 6),
              Text(
                'Filter Ruas & Koridor Tol',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkNavy,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Dropdown Row 1: Region & Ruas
          Row(
            children: [
              Expanded(
                child: _buildDropdown(
                  label: 'Region',
                  value: _selectedRegion,
                  items: ['Metropolitan', 'Trans Jawa', 'Nusantara'],
                  onChanged: (val) => setState(() => _selectedRegion = val!),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildDropdown(
                  label: 'Ruas',
                  value: _selectedRuas,
                  items: ['Dalam Kota', 'Jagorawi', 'Cipularang'],
                  onChanged: (val) => setState(() => _selectedRuas = val!),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Dropdown Row 2: Jalur + Button Terapkan
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Jalur',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.dividerSlate),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedJalur,
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
                          onChanged: (val) =>
                              setState(() => _selectedJalur = val!),
                          items: ['CAWANG - CENGKARENG', 'CENGKARENG - CAWANG']
                              .map((e) {
                                return DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                );
                              })
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: widget.onApply,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blue600,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Terapkan',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.dividerSlate),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
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
              onChanged: onChanged,
              items: items.map((e) {
                return DropdownMenuItem<String>(value: e, child: Text(e));
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

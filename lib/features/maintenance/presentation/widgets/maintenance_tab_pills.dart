import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class MaintenanceTabPills extends StatelessWidget {
  final int activeIndex;
  final Function(int)? onTabChanged;

  const MaintenanceTabPills({
    super.key,
    required this.activeIndex,
    this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = [
      'Summary',
      'Data Pemeliharaan',
      'Water Level Sensor',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isActive = activeIndex == index;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () {
                if (onTabChanged != null) {
                  onTabChanged!(index);
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: isActive ? AppColors.primaryActive : AppColors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    if (!isActive)
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.03),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                  ],
                ),
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isActive ? AppColors.white : AppColors.slate600,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
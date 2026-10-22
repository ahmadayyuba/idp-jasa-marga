import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';

class NotificationFilterPills  extends StatelessWidget {
  final int selectedIndex;
  final List<Map<String, dynamic>> filters;
  final ValueChanged<int> onSelected;

  const NotificationFilterPills({
    super.key,
    required this.selectedIndex,
    required this.filters,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          final filter = filters[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () => onSelected(index),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primaryActive
                      : AppColors.bgSlate,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Text(
                      filter['label'],
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? AppColors.white
                            : AppColors.slate600,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.blue800
                            : AppColors.dividerSlate,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${filter['count']}',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? AppColors.white
                              : AppColors.slate600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
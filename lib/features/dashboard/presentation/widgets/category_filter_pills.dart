import 'package:flutter/material.dart';

class CategoryFilterPills extends StatelessWidget {
  final int activeIndex;
  final Function(int) onCategoryChanged;

  const CategoryFilterPills({
    super.key,
    required this.activeIndex,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    final categories = ['Lalu Lintas', 'Pemeliharaan', 'Peralatan'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(categories.length, (index) {
        final isActive = activeIndex == index;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: index < categories.length - 1 ? 8.0 : 0,
            ),
            child: GestureDetector(
              onTap: () => onCategoryChanged(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isActive ? const Color(0xFF003399) : Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    if (!isActive)
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  categories[index],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isActive ? Colors.white : const Color(0xFF475569),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

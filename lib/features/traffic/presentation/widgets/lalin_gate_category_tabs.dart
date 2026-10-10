import 'package:flutter/material.dart';

class LalinGateCategoryTabs extends StatelessWidget {
  final int selectedIndex;
  final int selectedViewMode; // 0 = Gauge, 1 = Chart
  final ValueChanged<int> onCategoryChanged;
  final ValueChanged<int> onViewModeChanged;

  const LalinGateCategoryTabs({
    super.key,
    required this.selectedIndex,
    required this.selectedViewMode,
    required this.onCategoryChanged,
    required this.onViewModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Tab Gerbang Utama vs Gerbang Lainnya
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: const Color(0xFFE2E8F0).withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                _buildTab('Gerbang Utama', 0),
                _buildTab('Gerbang Lainnya', 1),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),

        // Capsule 2 Button Ikon Kanan (Gauge vs Chart)
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: const Color(0xFFE2E8F0).withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              // Button 1: Speedometer / Gauge Icon
              _buildIconButton(
                icon: Icons.speed_rounded,
                index: 0,
              ),
              const SizedBox(width: 2),
              // Button 2: Bar Chart Icon
              _buildIconButton(
                icon: Icons.bar_chart_rounded,
                index: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTab(String label, int index) {
    final isSelected = selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onCategoryChanged(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF003399) : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : const Color(0xFF475569),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton({required IconData icon, required int index}) {
    final isSelected = selectedViewMode == index;
    return GestureDetector(
      onTap: () => onViewModeChanged(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 16,
          color: isSelected ? const Color(0xFF003399) : const Color(0xFF64748B),
        ),
      ),
    );
  }
}
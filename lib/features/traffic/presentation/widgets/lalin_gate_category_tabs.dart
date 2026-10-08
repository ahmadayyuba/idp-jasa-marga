import 'package:flutter/material.dart';

class LalinGateCategoryTabs extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const LalinGateCategoryTabs({super.key, required this.onChanged});

  @override
  State<LalinGateCategoryTabs> createState() => _LalinGateCategoryTabsState();
}

class _LalinGateCategoryTabsState extends State<LalinGateCategoryTabs> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
        // Ikon Action Kanan
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.edit_note_rounded,
              size: 18, color: Color(0xFF475569)),
        ),
        const SizedBox(width: 6),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.bar_chart_rounded,
              size: 18, color: Color(0xFF475569)),
        ),
      ],
    );
  }

  Widget _buildTab(String label, int index) {
    final isSelected = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => _selectedIndex = index);
          widget.onChanged(index);
        },
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
}
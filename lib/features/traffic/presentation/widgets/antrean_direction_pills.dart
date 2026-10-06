import 'package:flutter/material.dart';

class AntreanDirectionPills extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const AntreanDirectionPills({super.key, required this.onChanged});

  @override
  State<AntreanDirectionPills> createState() => _AntreanDirectionPillsState();
}

class _AntreanDirectionPillsState extends State<AntreanDirectionPills> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          _buildPill('Dari Jakarta', 0),
          _buildPill('Menuju Jakarta', 1),
        ],
      ),
    );
  }

  Widget _buildPill(String title, int index) {
    final isSelected = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => _selectedIndex = index);
          widget.onChanged(index);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF003399) : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : const Color(0xFF003399),
            ),
          ),
        ),
      ),
    );
  }
}

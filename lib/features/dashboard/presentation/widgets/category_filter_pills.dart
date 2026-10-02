import 'package:flutter/material.dart';

class CategoryFilterPills extends StatefulWidget {
  const CategoryFilterPills({super.key});

  @override
  State createState() => _CategoryFilterPillsState();
}

class _CategoryFilterPillsState extends State {
  int _selectedIndex = 0;
  final List _categories = ['Lalu Lintas', 'Pemeliharaan', 'Peralatan'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children:List.generate(_categories.length, (index) { final isSelected = _selectedIndex == index; 
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: GestureDetector(
          onTap: () => setState(() => _selectedIndex = index),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF003399) : Colors.white,
                borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  _categories[index],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.white: 
                    Colors.black87
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
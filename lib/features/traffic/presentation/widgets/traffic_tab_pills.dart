import 'package:flutter/material.dart';

class TrafficTabPills extends StatefulWidget {
  const TrafficTabPills({super.key});

  @override
  State<TrafficTabPills> createState() => _TrafficTabPillsState();
}

class _TrafficTabPillsState extends State<TrafficTabPills> {
  int _selectedIndex = 0;
  final List<String> _tabs = [
    'Dashboard',
    'Realtime',
    'Antrean Gerbang',
    'Lalin Per Jam'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _tabs.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () => setState(() => _selectedIndex = index),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF003399) : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    _tabs[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFF475569),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
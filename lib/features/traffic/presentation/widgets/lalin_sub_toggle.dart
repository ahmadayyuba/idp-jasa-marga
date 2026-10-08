import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class LalinSubToggle extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const LalinSubToggle({super.key, required this.onChanged});

  @override
  State<LalinSubToggle> createState() => _LalinSubToggleState();
}

class _LalinSubToggleState extends State<LalinSubToggle> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFE2E8F0).withOpacity(0.6),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() => _selectedIndex = 0);
                widget.onChanged(0);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: _selectedIndex == 0
                      ? const Color(0xFF003399)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.adjust_rounded,
                      size: 14,
                      color: _selectedIndex == 0
                          ? Colors.white
                          : const Color(0xFF475569),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'GERBANG TOL',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: _selectedIndex == 0
                            ? Colors.white
                            : const Color(0xFF475569),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEF4444),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        '23',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() => _selectedIndex = 1);
                widget.onChanged(1);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: _selectedIndex == 1
                      ? const Color(0xFF003399)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.sensors_rounded,
                      size: 14,
                      color: _selectedIndex == 1
                          ? Colors.white
                          : const Color(0xFF475569),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'TRAFFIC COUNTING',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: _selectedIndex == 1
                            ? Colors.white
                            : const Color(0xFF475569),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
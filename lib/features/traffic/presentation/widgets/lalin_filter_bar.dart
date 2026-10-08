import 'package:flutter/material.dart';

class LalinFilterBar extends StatelessWidget {
  const LalinFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Dropdown Ruas
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Semua Ruas',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0F172A),
                  ),
                ),
                Icon(Icons.arrow_drop_down_rounded, color: Color(0xFF64748B)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),

        // Button Report Lalu Lintas
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF0284C7)),
          ),
          child: const Row(
            children: [
              Icon(Icons.description_outlined,
                  size: 16, color: Color(0xFF0284C7)),
              SizedBox(width: 6),
              Text(
                'Report Lalu Lintas',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0284C7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
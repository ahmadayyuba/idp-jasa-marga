import 'package:flutter/material.dart';

class TrafficHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBack;
  final VoidCallback onMenuTap;
  final VoidCallback onRefreshTap;

  const TrafficHeader({
    super.key,
    this.title = 'Lalu Lintas Tol',
    required this.onBack,
    required this.onMenuTap,
    required this.onRefreshTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Tombol Left Arrow
        InkWell(
          onTap: onBack,
          borderRadius: BorderRadius.circular(20),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xFF003399),
              size: 20,
            ),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF003399),
          ),
        ),
        const Spacer(),

        // Pill "9 Menu"
        InkWell(
          onTap: onMenuTap,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.grid_view_rounded,
                  size: 16,
                  color: Color(0xFF003399),
                ),
                SizedBox(width: 6),
                Text(
                  '9 Menu',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF003399),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),

        // Tombol Refresh
        InkWell(
          onTap: onRefreshTap,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.refresh_rounded,
              color: Color(0xFF003399),
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
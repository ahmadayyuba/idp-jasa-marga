import 'package:flutter/material.dart';

class CctvHeader extends StatelessWidget {
  const CctvHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: const BoxDecoration(
            color: Color(0xFFE0E7FF), // Biru pucat
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: const Text(
            'R',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E3A8A),
            ),
          ),
        ),
        const SizedBox(width: 12),

        // Teks Sapaan
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Halo',
                style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
              ),
              Text(
                'Anggun Windari!',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
            ],
          ),
        ),

        // Tombol Notifikasi
        Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Color(0xFF0F2B5B),
                  size: 20,
                ),
                onPressed: () {},
              ),
            ),
            Positioned(
              right: 12,
              top: 12,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFFEF4444), // Merah
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),

        // Tombol Refresh
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.refresh_rounded,
              color: Color(0xFF0F2B5B),
              size: 20,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

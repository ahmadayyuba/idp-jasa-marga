import 'package:flutter/material.dart';

class GangguanTrafficGrid extends StatelessWidget {
  const GangguanTrafficGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {'icon': Icons.build_rounded, 'label': 'Pekerjaan'},
      {'icon': Icons.minor_crash_rounded, 'label': 'Kecelakaan'},
      {'icon': Icons.warning_amber_rounded, 'label': 'Gangguan'},
      {'icon': Icons.home_rounded, 'label': 'Genangan'},
      {'icon': Icons.swap_horiz_rounded, 'label': 'Pengalihan'},
      {'icon': Icons.more_horiz_rounded, 'label': 'Lainnya'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Data Gangguan Lalu Lintas',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF003399),
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFEEF2FF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(item['icon'], color: const Color(0xFF003399), size: 20),
                  Text(
                    item['label'],
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';

class TrafficMetricCards extends StatelessWidget {
  const TrafficMetricCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Card 1: Rata-Rata Koridor
        Expanded(
          child: _buildMetricCard(
            bgColor: const Color(0xFF1E3A8A),
            title: 'Rata-Rata Koridor',
            icon: Icons.speed_rounded,
            value: '52.2',
            unit: 'Km/j',
            badgeWidget: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Color(0xFF22C55E),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
                const Text(
                  'Lancar',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),

        // Card 2: Segmen Tercepat
        Expanded(
          child: _buildMetricCard(
            bgColor: const Color(0xFF047857),
            title: 'Segmen Tercepat',
            icon: Icons.flash_on_rounded,
            value: '70',
            unit: 'Km/j',
            badgeWidget: const Text(
              'Jelambar',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),

        // Card 3: Titik Terpadat
        Expanded(
          child: _buildMetricCard(
            bgColor: const Color(0xFF9F1239),
            title: 'Titik Terpadat',
            icon: Icons.traffic_rounded,
            value: '11',
            unit: 'Km/j',
            badgeWidget: const Text(
              'Rawa Bokor',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard({
    required Color bgColor,
    required String title,
    required IconData icon,
    required String value,
    required String unit,
    required Widget badgeWidget,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(icon, size: 12, color: Colors.white70),
            ],
          ),
          const SizedBox(height: 6),

          // Value & Unit Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 3),
              Text(
                unit,
                style: const TextStyle(fontSize: 9, color: Colors.white70),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Bottom Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(6),
            ),
            child: badgeWidget,
          ),
        ],
      ),
    );
  }
}

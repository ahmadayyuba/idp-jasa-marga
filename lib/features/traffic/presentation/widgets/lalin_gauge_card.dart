import 'package:flutter/material.dart';

import 'radial_tick_gauge_painter.dart';

class LalinGaugeCard extends StatelessWidget {
  final String title;
  final String totalCount;
  final String timeRange;
  final String updateTime;
  final double percent;

  const LalinGaugeCard({
    super.key,
    required this.title,
    required this.totalCount,
    this.timeRange = '12.00 - 13.00',
    this.updateTime = 'update 2026-08-27 10:10:08',
    this.percent = 0.55,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // 1. Badge Judul Lokasi
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 12),

          // 2. Center Radial Gauge + Total Number
          SizedBox(
            width: 130,
            height: 110,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: const Size(130, 110),
                  painter: RadialTickGaugePainter(percent: percent),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 9,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                    Text(
                      totalCount,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const Text(
                      'Kendaraan',
                      style: TextStyle(
                        fontSize: 9,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Pill Dropdown Jam
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            timeRange,
                            style: const TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF334155),
                            ),
                          ),
                          const Icon(Icons.keyboard_arrow_down_rounded,
                              size: 10, color: Color(0xFF334155)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // 3. Legend Thresholds
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _LegendDot(color: Color(0xFFF59E0B), label: '>4.000'),
              SizedBox(width: 8),
              _LegendDot(color: Color(0xFFEF4444), label: '>5.500'),
            ],
          ),
          const SizedBox(height: 6),

          // 4. Update Time
          Text(
            updateTime,
            style: const TextStyle(
              fontSize: 8,
              color: Color(0xFF94A3B8),
            ),
          ),
        ],
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
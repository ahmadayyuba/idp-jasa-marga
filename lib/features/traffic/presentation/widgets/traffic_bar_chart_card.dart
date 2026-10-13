import 'package:flutter/material.dart';

class TrafficBarChartCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const TrafficBarChartCard({
    super.key,
    this.title = 'CAWANG - CENGKARENG',
    this.subtitle = 'Kecepatan Rata-Rata Kendaraan (Pukul 14:00 - 15:00)',
  });

  @override
  Widget build(BuildContext context) {
    // Data Dummy Bar Chart Kecepatan
    final List<Map<String, dynamic>> barItems = [
      {'val': 58, 'color': const Color(0xFF3B82F6)},
      {'val': 58, 'color': const Color(0xFF3B82F6)},
      {'val': 58, 'color': const Color(0xFF3B82F6)},
      {'val': 49, 'color': const Color(0xFF3B82F6)},
      {'val': 49, 'color': const Color(0xFF3B82F6)},
      {'val': 32, 'color': const Color(0xFFEF4444)},
      {'val': 55, 'color': const Color(0xFF3B82F6)},
      {'val': 70, 'color': const Color(0xFF10B981)},
      {'val': 68, 'color': const Color(0xFF10B981)},
      {'val': 70, 'color': const Color(0xFF10B981)},
      {'val': 52, 'color': const Color(0xFF3B82F6)},
      {'val': 52, 'color': const Color(0xFF3B82F6)},
      {'val': 43, 'color': const Color(0xFF3B82F6)},
      {'val': 34, 'color': const Color(0xFFEF4444)},
      {'val': 53, 'color': const Color(0xFF3B82F6)},
      {'val': 21, 'color': const Color(0xFFEF4444)},
      {'val': 11, 'color': const Color(0xFFEF4444)},
      {'val': 61, 'color': const Color(0xFF10B981)},
      {'val': 53, 'color': const Color(0xFF3B82F6)},
      {'val': 68, 'color': const Color(0xFF10B981)},
      {'val': 69, 'color': const Color(0xFF10B981)},
      {'val': 55, 'color': const Color(0xFF3B82F6)},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFF10B981),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.table_chart_rounded,
                      size: 14,
                      color: Color(0xFF475569),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'TABLE',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF475569),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 10, color: Color(0xFF64748B)),
          ),
          const SizedBox(height: 14),

          // Dark Background Chart Container
          Container(
            height: 180,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A),
              borderRadius: BorderRadius.circular(16),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final chartHeight = constraints.maxHeight - 20;
                return Stack(
                  children: [
                    // Y-Axis Lines & Labels
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildYAxisLine('80', chartHeight),
                        _buildYAxisLine('60', chartHeight),
                        _buildYAxisLine('40', chartHeight),
                        _buildYAxisLine('20', chartHeight),
                        _buildYAxisLine('0', chartHeight),
                      ],
                    ),

                    // Bars
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24, bottom: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: barItems.map((item) {
                            final double val = (item['val'] as num).toDouble();
                            final Color col = item['color'] as Color;
                            final double heightPct = val / 80.0;

                            return Container(
                              width: 6,
                              height: chartHeight * heightPct,
                              decoration: BoxDecoration(
                                color: col,
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(3),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 12),

          // Chart Legend Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildLegend(
                color: const Color(0xFF10B981),
                label: '≥ 60 Km/j (Lancar)',
              ),
              _buildLegend(
                color: const Color(0xFF3B82F6),
                label: '40-59 Km/j (Sedang)',
              ),
              _buildLegend(
                color: const Color(0xFFEF4444),
                label: '< 40 Km/j (Padat)',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildYAxisLine(String label, double containerHeight) {
    return Row(
      children: [
        SizedBox(
          width: 18,
          child: Text(
            label,
            style: const TextStyle(fontSize: 8, color: Colors.white38),
          ),
        ),
        const Expanded(
          child: Divider(color: Colors.white10, height: 1, thickness: 1),
        ),
      ],
    );
  }

  Widget _buildLegend({required Color color, required String label}) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w600,
            color: Color(0xFF475569),
          ),
        ),
      ],
    );
  }
}

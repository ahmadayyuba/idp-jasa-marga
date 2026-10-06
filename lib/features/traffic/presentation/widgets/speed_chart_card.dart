import 'package:flutter/material.dart';

class SpeedChartCard extends StatefulWidget {
  final String title;
  final String lastUpdate;
  final List<Map<String, dynamic>> barData;

  const SpeedChartCard({
    super.key,
    required this.title,
    required this.lastUpdate,
    required this.barData,
  });

  @override
  State<SpeedChartCard> createState() => _SpeedChartCardState();
}

class _SpeedChartCardState extends State<SpeedChartCard> {
  String _selectedDirection = 'B'; // Direction A / B

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Card: Title & Toggle A/B
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF003399),
                  ),
                ),
              ),

              // Direction Switcher (A / B)
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: const Color(0xFF003399),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    _buildDirectionBtn('A'),
                    _buildDirectionBtn('B'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Custom Bar Chart Section
          SizedBox(
            height: 180,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: widget.barData.map((item) {
                final double heightFactor = item['heightFactor'] as double;
                final Color barColor = item['color'] as Color;
                final String label = item['label'] as String;
                final bool hasTooltip = item['hasTooltip'] ?? false;
                final String? speed = item['speed'];

                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Tooltip Kupon Kecepatan
                      if (hasTooltip) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFFCBD5E1)),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 4),
                            ],
                          ),
                          child: Column(
                            children: [
                              Text(
                                label.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 7,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0F172A),
                                ),
                              ),
                              Text(
                                speed ?? '',
                                style: const TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF003399),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                      ],

                      // Batang Chart Membulat
                      Container(
                        width: 22,
                        height: 110 * heightFactor,
                        decoration: BoxDecoration(
                          color: barColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Label Lokasi Rotasi
                      Transform.rotate(
                        angle: -0.6,
                        child: Text(
                          label,
                          style: TextStyle(
                            fontSize: 7,
                            fontWeight:
                                hasTooltip ? FontWeight.bold : FontWeight.w600,
                            color: hasTooltip
                                ? const Color(0xFF003399)
                                : const Color(0xFF64748B),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20),

          // Footer Text Last Update
          Center(
            child: Text(
              'waktu terakhir update ${widget.lastUpdate}',
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFF94A3B8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDirectionBtn(String text) {
    final isSelected = _selectedDirection == text;
    return GestureDetector(
      onTap: () => setState(() => _selectedDirection = text),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: isSelected ? const Color(0xFF003399) : Colors.white,
          ),
        ),
      ),
    );
  }
}
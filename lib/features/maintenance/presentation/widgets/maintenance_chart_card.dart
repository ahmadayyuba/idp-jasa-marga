import 'package:flutter/material.dart';

class MaintenanceChartCard extends StatelessWidget {
  const MaintenanceChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul'];

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Grafik Pemeliharaan',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F2B5B),
                ),
              ),
              _buildFilterButton(),
            ],
          ),
          const SizedBox(height: 20),

          // Chart Y-Axis Scale Lines & Grouped Bars
          SizedBox(
            height: 180,
            child: Stack(
              children: [
                // Background Grid Lines
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildGridLine('100'),
                    _buildGridLine('100'),
                    _buildGridLine('50'),
                    _buildGridLine('0'),
                  ],
                ),

                // Grouped Bars
                Positioned.fill(
                  left: 30,
                  right: 10,
                  bottom: 24,
                  top: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: months.map((month) {
                      final isSelected = month == 'Apr';
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                _buildBar(0.55, const Color(0xFFC7D2FE)), // Realisasi Tahun Lalu
                                const SizedBox(width: 2),
                                _buildBar(0.75, const Color(0xFF818CF8)), // Realisasic Tahun Ini
                                const SizedBox(width: 2),
                                _buildBar(0.90, const Color(0xFF4F46E5)), // Rencana
                              ],
                            ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              month,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: 
                                    isSelected ? FontWeight.bold : 
                                    FontWeight.normal,
                              color: isSelected
                                    ? const Color(0xFF0F172A)
                                    : const Color(0xFF94A3B8),
                              ),
                            ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Legends
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegend(const Color(0xFFC7D2FE), 'Realisasi Tahun Lalu'),
              const SizedBox(width: 12),
              _buildLegend(const Color(0xFF818CF8), 'Realisasi Tahun Ini'),
              const SizedBox(width: 12),
              _buildLegend(const Color(0xFF4F46E5), 'Rencana'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBar(double heigthFactor, Color color){
    return FractionallySizedBox(
      heightFactor: heigthFactor,
      child: Container(
        width: 8,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
        ),
      ),
    );
  }

  Widget _buildGridLine(String label) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          child: Text(
            label,
            style: const TextStyle(fontSize: 9, color: Color(0xFFCBD5E1)),
          ),
        ),
        const Expanded(
          child: Divider(color: Color(0xFFF1F5F9), height: 1,
          ),
          ),
      ],
    );
  }

  Widget _buildFilterButton(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        children: [
          Icon(Icons.tune_rounded, size: 12, color: Color(0xFF64748B)),
          SizedBox(width: 4),
          Text(
            'Filter',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegend(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
            color: Color(0xFF475569),
          ),
        ),
      ],
    );
  }
}

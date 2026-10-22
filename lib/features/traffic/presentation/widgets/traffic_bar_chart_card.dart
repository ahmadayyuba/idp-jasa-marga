import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

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
      {'val': 58, 'color': AppColors.blue500},
      {'val': 58, 'color': AppColors.blue500},
      {'val': 58, 'color': AppColors.blue500},
      {'val': 49, 'color': AppColors.blue500},
      {'val': 49, 'color': AppColors.blue500},
      {'val': 32, 'color': AppColors.alertRed},
      {'val': 55, 'color': AppColors.blue500},
      {'val': 70, 'color': AppColors.successGreen},
      {'val': 68, 'color': AppColors.successGreen},
      {'val': 70, 'color': AppColors.successGreen},
      {'val': 52, 'color': AppColors.blue500},
      {'val': 52, 'color': AppColors.blue500},
      {'val': 43, 'color': AppColors.blue500},
      {'val': 34, 'color': AppColors.alertRed},
      {'val': 53, 'color': AppColors.blue500},
      {'val': 21, 'color': AppColors.alertRed},
      {'val': 11, 'color': AppColors.alertRed},
      {'val': 61, 'color': AppColors.successGreen},
      {'val': 53, 'color': AppColors.blue500},
      {'val': 68, 'color': AppColors.successGreen},
      {'val': 69, 'color': AppColors.successGreen},
      {'val': 55, 'color': AppColors.blue500},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
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
                        color: AppColors.successGreen,
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
                          color: AppColors.textPrimary,
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
                  color: AppColors.bgSlate,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.table_chart_rounded,
                      size: 14,
                      color: AppColors.slate600,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'TABLE',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: AppColors.slate600,
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
            style: const TextStyle(fontSize: 10, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 14),

          // Dark Background Chart Container
          Container(
            height: 180,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.textPrimary,
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
                color: AppColors.successGreen,
                label: '≥ 60 Km/j (Lancar)',
              ),
              _buildLegend(
                color: AppColors.blue500,
                label: '40-59 Km/j (Sedang)',
              ),
              _buildLegend(
                color: AppColors.alertRed,
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
            style: const TextStyle(fontSize: 8, color: AppColors.white38),
          ),
        ),
        const Expanded(
          child: Divider(color: AppColors.white10, height: 1, thickness: 1),
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
            color: AppColors.slate600,
          ),
        ),
      ],
    );
  }
}

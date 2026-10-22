import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class ActivityChartCard extends StatelessWidget {
  const ActivityChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'label': 'Scrapping', 'height': 0.5, 'color': AppColors.pastelBlue},
      {'label': 'Patching', 'height': 0.4, 'color': AppColors.patchingOrange},
      {'label': 'Rekonstruksi', 'height': 0.65, 'color': AppColors.mintGreen},
      {'label': 'Pekerjaan Lain', 'height': 0.35, 'color': AppColors.pastelBlue},
      {'label': 'Scrapping', 'height': 0.7, 'color': AppColors.patchingOrange},
      {'label': 'Patching', 'height': 0.45, 'color': AppColors.mintGreen},
      {'label': 'Rekonstruksi', 'height': 0.25, 'color': AppColors.pastelBlue},
      {'label': 'Rekonstruksi', 'height': 0.7, 'color': AppColors.patchingOrange},
      {'label': 'Pekerjaan Lain', 'height': 0.85, 'color': AppColors.mintGreen},
      {'label': 'Patching', 'height': 0.45, 'color': AppColors.pastelBlue},
      {'label': 'Pekerjaan Lain', 'height': 0.55, 'color': AppColors.patchingOrange},
      {'label': 'Rekonstruksi', 'height': 0.8, 'color': AppColors.mintGreen},
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
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Grafik Per Kegiatan',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkNavy,
                ),
              ),
              _buildFilterButton(),
            ],
          ),
          const SizedBox(height: 20),

          // Horizontal Scrolling Bar Chart
          SizedBox(
            height: 180,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: items.map((item) {
                  final label = item['label'] as String;
                  final heightFactor = item['height'] as double;
                  final color = item['color'] as Color;

                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 18,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: FractionallySizedBox(
                              heightFactor: heightFactor,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Transform.rotate(
                          angle: -0.6,
                          child: Text(
                            label,
                            style: const TextStyle(
                              fontSize: 7,
                              color: AppColors.textMuted,
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
          ),
          const SizedBox(height: 16),

          // Legends
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegend(AppColors.pastelBlue, 'Dalam Rencana'),
              const SizedBox(width: 12),
              _buildLegend(AppColors.patchingOrange, 'Proses'),
              const SizedBox(width: 12),
              _buildLegend(AppColors.mintGreen, 'Selesai'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.bgGradientEnd,
        border: Border.all(color: AppColors.dividerSlate),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        children: [
          Icon(Icons.tune_rounded, size: 12, color: AppColors.textSecondary),
          SizedBox(width: 4),
          Text(
            'Filter',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
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
            color: AppColors.slate600,
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';

import 'traffic_header.dart';
import 'traffic_tab_pills.dart';
import 'traffic_speed_summary_pills.dart';
import 'speed_chart_card.dart';

import '../../../dashboard/presentation/widgets/custom_bottom_nav_bar.dart';
import '../../../../core/constants/app_colors.dart';

class RealtimeTrafficScreen extends StatelessWidget {
  const RealtimeTrafficScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data Dummy Grafik 1: Jakarta - Tangerang
    final List<Map<String, dynamic>> jakartaTangerangData = [
      {
        'label': 'SS TOMANG',
        'heightFactor': 0.45,
        'color': AppColors.alertRed,
      },
      {
        'label': 'KEBON JERUK',
        'heightFactor': 0.70,
        'color': AppColors.blue400,
      },
      {
        'label': 'KEBON JERUK',
        'heightFactor': 0.90,
        'color': AppColors.primaryBlue,
        'hasTooltip': true,
        'speed': '17 Km/Jam',
      },
      {
        'label': 'MERUYA',
        'heightFactor': 0.72,
        'color': AppColors.blue400,
      },
      {
        'label': 'SS KEMBANGAN',
        'heightFactor': 0.68,
        'color': AppColors.blue400,
      },
      {
        'label': 'KR TENGAH',
        'heightFactor': 0.52,
        'color': AppColors.alertAmber,
      },
      {
        'label': 'KUNCIRAN',
        'heightFactor': 0.72,
        'color': AppColors.blue400,
      },
      {
        'label': 'TANGERANG',
        'heightFactor': 0.95,
        'color': AppColors.blue400,
      },
      {
        'label': 'KARAWACI',
        'heightFactor': 0.88,
        'color': AppColors.blue400,
      },
    ];

    // Data Dummy Grafik 2: Dalam Kota
    final List<Map<String, dynamic>> dalamKotaData = [
      {
        'label': 'SEMANGGI',
        'heightFactor': 0.35,
        'color': AppColors.alertRed,
      },
      {
        'label': 'SENAYAN',
        'heightFactor': 0.65,
        'color': AppColors.blue400,
      },
      {
        'label': 'KUNINGAN',
        'heightFactor': 0.85,
        'color': AppColors.primaryBlue,
        'hasTooltip': true,
        'speed': '25 Km/Jam',
      },
      {
        'label': 'TEBET',
        'heightFactor': 0.50,
        'color': AppColors.alertAmber,
      },
      {
        'label': 'CAWANG',
        'heightFactor': 0.60,
        'color': AppColors.blue400,
      },
      {
        'label': 'HALIM',
        'heightFactor': 0.62,
        'color': AppColors.blue400,
      },
      {
        'label': 'GROGOL',
        'heightFactor': 0.48,
        'color': AppColors.alertAmber,
      },
      {
        'label': 'SLIPI',
        'heightFactor': 0.75,
        'color': AppColors.blue400,
      },
      {
        'label': 'TOMANG',
        'heightFactor': 0.80,
        'color': AppColors.blue400,
      },
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.bgGradientStart, AppColors.bgGradientEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TrafficHeader(
                      onBack: () => Navigator.of(context).pop(),
                      onMenuTap: () {},
                      onRefreshTap: () {},
                    ),
                    const SizedBox(height: 16),
                    const TrafficTabPills(activeIndex: 3),
                    const SizedBox(height: 20),
                    const TrafficSpeedSummaryPills(),
                    const SizedBox(height: 16),

                    // Filter Button
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.borderSlate),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.tune_rounded,
                              size: 14,
                              color: AppColors.primaryActive,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Filter',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryActive,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Grafik 1: Jakarta - Tangerang
                    SpeedChartCard(
                      title: 'Jakarta - Tangerang',
                      lastUpdate: '2022-09-04 22:20:17',
                      barData: jakartaTangerangData,
                    ),
                    const SizedBox(height: 16),

                    // Grafik 2: Dalam Kota
                    SpeedChartCard(
                      title: 'Dalam Kota',
                      lastUpdate: '2022-09-04 22:20:17',
                      barData: dalamKotaData,
                    ),
                    const SizedBox(height: 80), // Spacer bottom nav
                  ],
                ),
              ),

             
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

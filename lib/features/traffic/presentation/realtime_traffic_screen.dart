import 'package:flutter/material.dart';

import 'widgets/traffic_header.dart';
import 'widgets/traffic_tab_pills.dart';
import 'widgets/traffic_speed_summary_pills.dart';
import 'widgets/speed_chart_card.dart';

import '../../dashboard/presentation/widgets/floating_side_button.dart';
import '../../dashboard/presentation/widgets/custom_bottom_nav_bar.dart';
import '../../dashboard/presentation/dashboard_screen.dart';

class RealtimeTrafficScreen extends StatelessWidget {
  const RealtimeTrafficScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> jakartaTangerangData = [
      {
        'label': 'SS TOMANG',
        'heightFactor': 0.45,
        'color': const Color(0xFFEF4444),
      },
      {
        'label': 'KEBON JERUK',
        'heightFactor': 0.70,
        'color': const Color(0xFF60A5FA),
      },
      {
        'label': 'KEBON JERUK',
        'heightFactor': 0.90,
        'color': const Color(0xFF1E3A8A),
        'hasTooltip': true,
        'speed': '17 Km/Jam',
      },
      {
        'label': 'MERUYA',
        'heightFactor': 0.72,
        'color': const Color(0xFF60A5FA),
      },
      {
        'label': 'SS KEMBANGAN',
        'heightFactor': 0.68,
        'color': const Color(0xFF60A5FA),
      },
      {
        'label': 'KR TENGAH',
        'heightFactor': 0.52,
        'color': const Color(0xFFF59E0B),
      },
      {
        'label': 'KUNCIRAN',
        'heightFactor': 0.72,
        'color': const Color(0xFF60A5FA),
      },
      {
        'label': 'TANGERANG',
        'heightFactor': 0.95,
        'color': const Color(0xFF60A5FA),
      },
      {
        'label': 'KARAWACI',
        'heightFactor': 0.88,
        'color': const Color(0xFF60A5FA),
      },
    ];

    final List<Map<String, dynamic>> dalamKotaData = [
      {
        'label': 'SEMANGGI',
        'heightFactor': 0.35,
        'color': const Color(0xFFEF4444),
      },
      {
        'label': 'SENAYAN',
        'heightFactor': 0.65,
        'color': const Color(0xFF60A5FA),
      },
      {
        'label': 'KUNINGAN',
        'heightFactor': 0.85,
        'color': const Color(0xFF1E3A8A),
        'hasTooltip': true,
        'speed': '25 Km/Jam',
      },
      {
        'label': 'TEBET',
        'heightFactor': 0.50,
        'color': const Color(0xFFF59E0B),
      },
      {
        'label': 'CAWANG',
        'heightFactor': 0.60,
        'color': const Color(0xFF60A5FA),
      },
      {
        'label': 'HALIM',
        'heightFactor': 0.62,
        'color': const Color(0xFF60A5FA),
      },
      {
        'label': 'GROGOL',
        'heightFactor': 0.48,
        'color': const Color(0xFFF59E0B),
      },
      {
        'label': 'SLIPI',
        'heightFactor': 0.75,
        'color': const Color(0xFF60A5FA),
      },
      {
        'label': 'TOMANG',
        'heightFactor': 0.80,
        'color': const Color(0xFF60A5FA),
      },
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0F2FE), Color(0xFFF8FAFC)],
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
                      onBack: () {
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        } else {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const DashboardScreen(),
                            ),
                          );
                        }
                      },
                      onMenuTap: () {
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        }
                      },
                      onRefreshTap: () {},
                    ),
                    const SizedBox(height: 16),
                    const TrafficTabPills(activeIndex: 1),
                    const SizedBox(height: 20),
                    const TrafficSpeedSummaryPills(),
                    const SizedBox(height: 16),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFFCBD5E1)),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.tune_rounded,
                              size: 14,
                              color: Color(0xFF003399),
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Filter',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF003399),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    SpeedChartCard(
                      title: 'Jakarta - Tangerang',
                      lastUpdate: '2022-09-04 22:20:17',
                      barData: jakartaTangerangData,
                    ),
                    const SizedBox(height: 16),
                    SpeedChartCard(
                      title: 'Dalam Kota',
                      lastUpdate: '2022-09-04 22:20:17',
                      barData: dalamKotaData,
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),

              Positioned(
                right: 0,
                bottom: MediaQuery.of(context).size.height * 0.15,
                child: FloatingSideButton(onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

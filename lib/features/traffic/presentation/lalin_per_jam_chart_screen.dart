import 'package:flutter/material.dart';

import 'widgets/traffic_header.dart';
import 'widgets/traffic_tab_pills.dart';
import 'widgets/lalin_sub_toggle.dart';
import 'widgets/lalin_filter_bar.dart';
import 'widgets/lalin_gate_category_tabs.dart';
import 'widgets/lalin_bar_chart_card.dart';

// Reusable Dashboard Widgets
import '../../dashboard/presentation/dashboard_screen.dart';
import '../../dashboard/presentation/widgets/floating_side_button.dart';
import '../../dashboard/presentation/widgets/custom_bottom_nav_bar.dart';

class LalinPerJamChartScreen extends StatelessWidget {
  const LalinPerJamChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data Dummy Grafik 24 Jam GT Cikampek Utama 1
    final List<Map<String, dynamic>> cikampekUtama1Data = [
      {'time': '00:00', 'count': 266},
      {'time': '01:00', 'count': 128},
      {'time': '02:00', 'count': 130},
      {'time': '03:00', 'count': 84},
      {'time': '04:00', 'count': 129},
      {'time': '05:00', 'count': 312},
      {'time': '06:00', 'count': 655},
      {'time': '07:00', 'count': 654},
      {'time': '08:00', 'count': 580},
      {'time': '09:00', 'count': 562},
      {'time': '10:00', 'count': 481},
      {'time': '11:00', 'count': 1850},
      {'time': '12:00', 'count': 2630, 'isHighlighted': true},  
      {'time': '13:00', 'count': 2410},
      {'time': '14:00', 'count': 2180},
      {'time': '15:00', 'count': 2750},
      {'time': '16:00', 'count': 3420},
      {'time': '17:00', 'count': 4210},
      {'time': '18:00', 'count': 4650},
      {'time': '19:00', 'count': 3890},
      {'time': '20:00', 'count': 2980},
      {'time': '21:00', 'count': 1840},
      {'time': '22:00', 'count': 1120},
      {'time': '23:00', 'count': 680},
    ];

    // Data Dummy Grafik GT Cikampek Utama 2 (Ada Lonjakan Merah >5500)
    final List<Map<String, dynamic>> cikampekUtama2Data = [
      {'time': '00:00', 'count': 310},
      {'time': '01:00', 'count': 190},
      {'time': '02:00', 'count': 160},
      {'time': '03:00', 'count': 110},
      {'time': '04:00', 'count': 180},
      {'time': '05:00', 'count': 420},
      {'time': '06:00', 'count': 890},
      {'time': '07:00', 'count': 1450},
      {'time': '08:00', 'count': 1680},
      {'time': '09:00', 'count': 1820},
      {'time': '10:00', 'count': 1940},
      {'time': '11:00', 'count': 2210},
      {'time': '12:00', 'count': 2630, 'isHighlighted': true},
      {'time': '13:00', 'count': 2810},
      {'time': '14:00', 'count': 3120},
      {'time': '15:00', 'count': 3890},
      {'time': '16:00', 'count': 4890},
      {'time': '17:00', 'count': 5620}, // Merah Kritis
      {'time': '18:00', 'count': 5120},
      {'time': '19:00', 'count': 4210},
      {'time': '20:00', 'count': 3120},
      {'time': '21:00', 'count': 2040},
      {'time': '22:00', 'count': 1280},
      {'time': '23:00', 'count': 740},
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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
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
                          Navigator.of(context).popUntil((route) => route.isFirst);
                        }
                      },
                      onRefreshTap: () {},
                    ),
                    const SizedBox(height: 16),
                    const TrafficTabPills(),
                    const SizedBox(height: 16),

                    // Sub Toggle
                    LalinSubToggle(onChanged: (index) {}),
                    const SizedBox(height: 16),

                    // Filter Bar
                    const LalinFilterBar(),
                    const SizedBox(height: 16),

                    // Gate Category Tabs
                    LalinGateCategoryTabs(onChanged: (index) {}),
                    const SizedBox(height: 16),

                    // List Kartu Grafik Batang
                    LalinBarChartCard(
                      title: 'GT CIKAMPEK UTAMA 1',
                      hourlyData: cikampekUtama1Data,
                    ),
                    const SizedBox(height: 16),
                    LalinBarChartCard(
                      title: 'GT CIKAMPEK UTAMA 2',
                      hourlyData: cikampekUtama2Data,
                    ),
                    const SizedBox(height: 80), // Spacer bottom nav
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
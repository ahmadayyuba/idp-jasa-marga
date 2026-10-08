import 'package:flutter/material.dart';

import 'widgets/traffic_header.dart';
import 'widgets/traffic_tab_pills.dart';
import 'widgets/lalin_sub_toggle.dart';
import 'widgets/lalin_filter_bar.dart';
import 'widgets/lalin_gate_category_tabs.dart';
import 'widgets/lalin_gauge_card.dart';

import '../../dashboard/presentation/dashboard_screen.dart';
import '../../dashboard/presentation/widgets/floating_side_button.dart';
import '../../dashboard/presentation/widgets/custom_bottom_nav_bar.dart';

class LalinPerJamScreen extends StatelessWidget {
  const LalinPerJamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> gateList = [
      {
        'title': 'Keluar Jakarta (Cikatama 1 + Kalitama 1 + Kalihurip 1)',
        'totalCount': '2630',
        'percent': 0.65,
      },
      {
        'title': 'Masuk Jakarta (Cikatama 2 + Kalihurip 2 + Kalitama 2) - Kalita...',
        'totalCount': '2630',
        'percent': 0.65,
      },
      {
        'title': 'Keluar Jakarta (GT Cikupa 1 + Balaraja Timur 1)',
        'totalCount': '2540',
        'percent': 0.58,
      },
      {
        'title': 'Masuk Jakarta (GT Cikupa 2 - Merak to JKT)',
        'totalCount': '2780',
        'percent': 0.72,
      },
      {
        'title': 'Keluar Jakarta (GT Ciawi 1 - Arah Bogor / Ciawi)',
        'totalCount': '2150',
        'percent': 0.45,
      },
      {
        'title': 'Masuk Jakarta (GT Ciawi 2 - Ciawi to Cawang)',
        'totalCount': '2420',
        'percent': 0.52,
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

                    // Sub Toggle (GERBANG TOL vs TRAFFIC COUNTING)
                    LalinSubToggle(onChanged: (index) {}),
                    const SizedBox(height: 16),

                    // Filter Bar
                    const LalinFilterBar(),
                    const SizedBox(height: 16),

                    // Gate Category Tabs
                    LalinGateCategoryTabs(onChanged: (index) {}),
                    const SizedBox(height: 16),

                    // Grid 2 Kolom Cards
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: gateList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.82,
                      ),
                      itemBuilder: (context, index) {
                        final item = gateList[index];
                        return LalinGaugeCard(
                          title: item['title'],
                          totalCount: item['totalCount'],
                          percent: item['percent'],
                        );
                      },
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
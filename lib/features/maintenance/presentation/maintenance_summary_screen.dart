import 'package:flutter/material.dart';

import 'widgets/maintenance_header.dart';
import 'widgets/maintenance_tab_pills.dart';
import 'widgets/maintenance_chart_card.dart';
import 'widgets/activity_chart_card.dart';

// Reusable Dashboard Widgets
import '../../dashboard/presentation/widgets/floating_side_button.dart';
import '../../dashboard/presentation/widgets/custom_bottom_nav_bar.dart';

class MaintenanceSummaryScreen extends StatefulWidget {
  const MaintenanceSummaryScreen({super.key});

  @override
  State<MaintenanceSummaryScreen> createState() =>
      _MaintenanceSummaryScreenState();
}

class _MaintenanceSummaryScreenState extends State<MaintenanceSummaryScreen> {
  int _activeTab = 0;

  @override
  Widget build(BuildContext context) {
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
                  children: [
                    MaintenanceHeader(
                      onBack: () {
                        Navigator.of(context).maybePop();
                      },
                    ),
                    const SizedBox(height: 16),

                    MaintenanceTabPills(
                      activeIndex: _activeTab,
                      onTabChanged: (index) {
                        setState(() {
                          _activeTab = index;
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    // Card 1: Grafik Pemeliharaan
                    const MaintenanceChartCard(),
                    const SizedBox(height: 16),

                    // Card 2: Grafik Per Kegiatan
                    const ActivityChartCard(),
                    const SizedBox(height: 16),

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

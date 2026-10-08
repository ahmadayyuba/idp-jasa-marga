import 'package:flutter/material.dart';

import '../traffic/presentation/widgets/traffic_header.dart';
import '../traffic/presentation/widgets/traffic_tab_pills.dart';
import '../traffic/presentation/widgets/rekayasa_traffic_card.dart';
import '../traffic/presentation/widgets/gangguan_traffic_grid.dart';
import '../traffic/presentation/widgets/odol_chart_card.dart';
import '../dashboard/presentation/widgets/floating_side_button.dart';
import '../dashboard/presentation/widgets/custom_bottom_nav_bar.dart';
import '../dashboard/presentation/dashboard_screen.dart';

class TrafficDashboardScreen extends StatelessWidget {
  const TrafficDashboardScreen({super.key});

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
                            ), // <-- Kurung tutup MaterialPageRoute SEHARUSNYA di sini!
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
                    const TrafficTabPills(),
                    const SizedBox(height: 20),
                    const RekayasaTrafficCard(),
                    const SizedBox(height: 20),
                    const GangguanTrafficGrid(),
                    const SizedBox(height: 20),
                    const OdolChartCard(),
                    const SizedBox(height: 80), // Spacer bottom nav
                  ],
                ),
              ),

              // Reusable Floating Side Button
              Positioned(
                right: 0,
                bottom: MediaQuery.sizeOf(context).height * 0.15,
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

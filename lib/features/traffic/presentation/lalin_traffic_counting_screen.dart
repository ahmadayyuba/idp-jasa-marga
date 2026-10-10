import 'package:flutter/material.dart';

import 'widgets/traffic_header.dart';
import 'widgets/traffic_tab_pills.dart';
import 'widgets/lalin_sub_toggle.dart';
import 'widgets/lalin_filter_bar.dart';
import 'widgets/traffic_counting_card.dart';

// Reusable Dashboard Widgets
import '../../dashboard/presentation/dashboard_screen.dart';
import '../../dashboard/presentation/widgets/floating_side_button.dart';
import '../../dashboard/presentation/widgets/custom_bottom_nav_bar.dart';

class LalinTrafficCountingScreen extends StatelessWidget {
  const LalinTrafficCountingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> countingList = [
      {
        'title': 'Radar Dalkot KM 02+900 A',
        'subtitle': 'Dalam Kota (Dalkot) • KM 02+900 (Arah Tomang)',
        'speedText': '64 Km/h',
        'volumeText': '3720',
        'percent': 0.48,
      },
      {
        'title': 'Radar Dalkot KM 02+900 B',
        'subtitle': 'Dalam Kota (Dalkot) • KM 02+900 (Arah Cawang)',
        'speedText': '67 Km/h',
        'volumeText': '3540',
        'percent': 0.42,
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
                    const TrafficTabPills(activeIndex: 3),
                    const SizedBox(height: 16),

                    // Sub Toggle (Pilih TRAFFIC COUNTING / Index 1)
                    LalinSubToggle(
                      selectedIndex: 1,
                      onChanged: (index) {
                        if (index == 0) {
                          // Jika user klik GERBANG TOL, kembali ke screen Gerbang Tol
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                    const SizedBox(height: 16),

                    // Filter Bar
                    const LalinFilterBar(),
                    const SizedBox(height: 16),

                    // List 1 Kolom Traffic Counting Cards
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: countingList.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final item = countingList[index];
                        return TrafficCountingCard(
                          title: item['title'],
                          subtitle: item['subtitle'],
                          speedText: item['speedText'],
                          volumeText: item['volumeText'],
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

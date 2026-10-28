import 'package:flutter/material.dart';

import 'widgets/traffic_header.dart';
import 'widgets/traffic_tab_pills.dart';
import 'widgets/kinerja_summary_cards.dart';
import 'widgets/kinerja_ruas_card.dart';

// Reusable Dashboard Widgets
import '../../dashboard/presentation/dashboard_screen.dart';

import '../../dashboard/presentation/widgets/custom_bottom_nav_bar.dart';
import '../../../core/constants/app_colors.dart';

class KinerjaLalinScreen extends StatelessWidget {
  const KinerjaLalinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data Dummy Kinerja Ruas Tol sesuai Figma Mockup
    final List<Map<String, dynamic>> kinerjaList = [
      {
        'ruasTitle': 'Tol Jagorawi (Cawang - Ciawi)',
        'vcRatio': 0.62,
        'losText': 'LOS B (Arus Stabil)',
        'speedText': '78.5 km/j',
      },
      {
        'ruasTitle': 'Tol Jakarta - Cikampek',
        'vcRatio': 0.78,
        'losText': 'LOS C (Arus Terkendali)',
        'speedText': '68.2 km/j',
      },
      {
        'ruasTitle': 'Tol Dalam Kota (Dalkot)',
        'vcRatio': 0.84,
        'losText': 'LOS D (Mendekati Jenuh)',
        'speedText': '52.0 km/j',
      },
      {
        'ruasTitle': 'Tol JORR Non-S (E1, E2, E3)',
        'vcRatio': 0.71,
        'losText': 'LOS C (Arus Terkendali)',
        'speedText': '71.4 km/j',
      },
      {
        'ruasTitle': 'Tol Cipularang & Padaleunyi',
        'vcRatio': 0.54,
        'losText': 'LOS B (Arus Lancar)',
        'speedText': '82.1 km/j',
      },
      {
        'ruasTitle': 'Tol Trans Jawa (Palimanan - Semarang)',
        'vcRatio': 0.48,
        'losText': 'LOS A (Sangat Lancar)',
        'speedText': '88.6 km/j',
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

                    // Top Navigation Tab Pills (Aktifkan Index Sesuai Kinerja Lalin)
                    const TrafficTabPills(activeIndex: 5),
                    const SizedBox(height: 16),

                    // Summary KPI & Banner Header
                    const KinerjaSummaryCards(
                      spmValue: '99.4%',
                      speedAvgValue: '74.2 km/j',
                    ),
                    const SizedBox(height: 20),

                    // Section Title
                    const Text(
                      'Kinerja V/C Ratio per Ruas',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkNavy,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // List Cards Kinerja per Ruas
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: kinerjaList.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final item = kinerjaList[index];
                        return KinerjaRuasCard(
                          ruasTitle: item['ruasTitle'],
                          vcRatio: item['vcRatio'],
                          losText: item['losText'],
                          speedText: item['speedText'],
                        );
                      },
                    ),

                    const SizedBox(height: 80),
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

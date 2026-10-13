import 'package:flutter/material.dart';

import 'widgets/traffic_header.dart';
import 'widgets/traffic_tab_pills.dart';
import 'widgets/gangguan_lalin_filter_card.dart';
import 'widgets/gangguan_lalin_item_card.dart';

// Reusable Dashboard Widgets
import '../../dashboard/presentation/dashboard_screen.dart';
import '../../dashboard/presentation/widgets/floating_side_button.dart';
import '../../dashboard/presentation/widgets/custom_bottom_nav_bar.dart';

class GangguanLalinScreen extends StatelessWidget {
  const GangguanLalinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> incidentList = [
      {
        'title': 'Cipularang',
        'kmTag': 'KM 093+100 (A)',
        'description': 'Kendaraan Gangguan (Lajur: Bahu)',
        'timeText': '2026-09-02 15:23:00',
        'status': GangguanStatus.dalamPenanganan,
      },
      {
        'title': 'Gempol-Pandaan',
        'kmTag': 'KM 049+000 (B)',
        'description': 'Kendaraan Gangguan (Lajur: Bahu)',
        'timeText': '2026-09-02 15:09:00',
        'status': GangguanStatus.dalamPenanganan,
      },
      {
        'title': 'Ngawi-Kertosono-Kediri',
        'kmTag': 'KM 586+800 (A)',
        'description': 'Lain-lain (Lajur: Row)',
        'timeText': '2026-09-02 15:08:00',
        'status': GangguanStatus.dalamPenanganan,
      },
      {
        'title': 'Jagorawi',
        'kmTag': 'KM 014+200 (B)',
        'description': 'Ban Pecah Truk Box (Lajur: 1)',
        'timeText': '2026-09-02 14:50:00',
        'status': GangguanStatus.belumDitangani,
      },
      {
        'title': 'Jakarta-Cikampek',
        'kmTag': 'KM 037+200 (A)',
        'description': 'Kendaraan Mogok (Lajur: Bahu)',
        'timeText': '2026-09-02 14:10:00',
        'status': GangguanStatus.selesai,
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

                    // Top Navigation Tab Pills (Aktifkan Index Sesuai Konfigurasi)
                    const TrafficTabPills(activeIndex: 4),
                    const SizedBox(height: 16),

                    // Filter Section
                    GangguanLalinFilterCard(
                      incidentCount: incidentList.length,
                      onApply: () {},
                      onReset: () {},
                    ),
                    const SizedBox(height: 16),

                    // Incident Cards List
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: incidentList.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final item = incidentList[index];
                        return GangguanLalinItemCard(
                          title: item['title'],
                          kmTag: item['kmTag'],
                          description: item['description'],
                          timeText: item['timeText'],
                          status: item['status'],
                        );
                      },
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

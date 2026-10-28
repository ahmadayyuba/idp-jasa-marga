import 'package:flutter/material.dart';

import 'widgets/maintenance_header.dart';
import 'widgets/maintenance_tab_pills.dart';
import 'widgets/maintenance_banner_card.dart';
import 'widgets/maintenance_kpi_row.dart';
import 'widgets/maintenance_search_filter.dart';
import 'widgets/maintenance_task_card.dart';

// Reusable Dashboard Widgets
import '../../dashboard/presentation/widgets/floating_side_button.dart';
import '../../dashboard/presentation/widgets/custom_bottom_nav_bar.dart';
import '../../../core/constants/app_colors.dart';

class DataPemeliharaanScreen extends StatefulWidget {
  const DataPemeliharaanScreen({super.key});

  @override
  State<DataPemeliharaanScreen> createState() => _DataPemeliharaanScreenState();
}

class _DataPemeliharaanScreenState extends State<DataPemeliharaanScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _taskList = [
    {
      'title': 'Rekonstruksi Rigid Pavement',
      'statusLabel': 'Sedang Berlangsung',
      'isCompleted': false,
      'ruasName': 'Jakarta - Cikampek',
      'locationDetail': 'KM 32+400 s/d KM 32+750 Jalur A Lajur 1',
      'progressPercent': 85,
      'pelaksana': 'PT Jasamarga Tollroad Maintenance',
      'targetDate': '2026-08-29',
    },
    {
      'title': 'Scrapping Filling Overlay (SFO)',
      'statusLabel': 'Selesai 100%',
      'isCompleted': true,
      'ruasName': 'Jagorawi',
      'locationDetail': 'KM 18+200 Jalur B Lajur 2 & 3',
      'progressPercent': 100,
      'pelaksana': 'PT Jasamarga Tollroad Maintenance',
      'targetDate': '2026-08-22',
    },
    {
      'title': 'Patching Cepat Lubang Jalan',
      'statusLabel': 'Sedang Berlangsung',
      'isCompleted': false,
      'ruasName': 'Tol Dalam Kota',
      'locationDetail': 'KM 08+500 Jalur A Bahu Jalan',
      'progressPercent': 40,
      'pelaksana': 'Tim Reaksi Cepat JMTM',
      'targetDate': '2026-08-27',
    },
    {
      'title': 'Pengecatan Marka Thermoplastic',
      'statusLabel': 'Selesai 100%',
      'isCompleted': true,
      'ruasName': 'JORR Non-S',
      'locationDetail': 'KM 45+000 s/d 48+000',
      'progressPercent': 100,
      'pelaksana': 'PT Jasamarga Tollroad Maintenance',
      'targetDate': '2026-08-18',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  children: [
                    MaintenanceHeader(
                      onBack: () => Navigator.of(context).maybePop(),
                    ),
                    const SizedBox(height: 16),

                    // Tab Pills (Index 1 = Data Pemeliharaan)
                    MaintenanceTabPills(
                      activeIndex: 1,
                      onTabChanged: (index) {
                        if (index == 0) {
                          Navigator.of(context).pushReplacementNamed('/maintenance-summary');
                        }
                      },
                    ),
                    const SizedBox(height: 16),

                    const MaintenanceBannerCard(),
                    const SizedBox(height: 16),

                    const MaintenanceKpiRow(
                      totalProyek: 24,
                      totalProses: 14,
                      totalSelesai: 10,
                    ),
                    const SizedBox(height: 16),

                    MaintenanceSearchFilter(
                      searchController: _searchController,
                      onFilterTap: () {},
                    ),
                    const SizedBox(height: 16),

                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _taskList.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final task = _taskList[index];
                        return MaintenanceTaskCard(
                          title: task['title'],
                          statusLabel: task['statusLabel'],
                          isCompleted: task['isCompleted'],
                          ruasName: task['ruasName'],
                          locationDetail: task['locationDetail'],
                          progressPercent: task['progressPercent'],
                          pelaksana: task['pelaksana'],
                          targetDate: task['targetDate'],
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
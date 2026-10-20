import 'package:flutter/material.dart';

import 'widgets/maintenance_header.dart';
import 'widgets/maintenance_tab_pills.dart';

// Import Konten Widget
import 'widgets/maintenance_chart_card.dart';
import 'widgets/activity_chart_card.dart';
import 'widgets/maintenance_banner_card.dart';
import 'widgets/maintenance_kpi_row.dart';
import 'widgets/maintenance_search_filter.dart';
import 'widgets/maintenance_task_card.dart';

// Reusable Dashboard Widgets
import '../../dashboard/presentation/widgets/floating_side_button.dart';
import '../../dashboard/presentation/widgets/custom_bottom_nav_bar.dart';

class MaintenanceParentScreen extends StatefulWidget {
  final int initialIndex;

  const MaintenanceParentScreen({super.key, this.initialIndex = 0});

  @override
  State<MaintenanceParentScreen> createState() =>
      _MaintenanceParentScreenState();
}

class _MaintenanceParentScreenState extends State<MaintenanceParentScreen> {
  late int _activeTab;
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
  ];

  @override
  void initState() {
    super.initState();
    _activeTab = widget.initialIndex;
  }

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
                      onBack: () => Navigator.of(context).maybePop(),
                    ),
                    const SizedBox(height: 16),

                    // Tab Pills
                    MaintenanceTabPills(
                      activeIndex: _activeTab,
                      onTabChanged: (index) {
                        setState(() {
                          _activeTab = index;
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    // MENGGUNAKAN INDEXEDSTACK AGAR TIDAK RE-BUILD DARI NOL
                    IndexedStack(
                      index: _activeTab,
                      children: [
                        // Tab 0: Summary View
                        const Column(
                          children: [
                            RepaintBoundary(child: MaintenanceChartCard()),
                            SizedBox(height: 16),
                            RepaintBoundary(child: ActivityChartCard()),
                          ],
                        ),

                        // Tab 1: Data Pemeliharaan View
                        Column(
                          children: [
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
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 12),
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
                          ],
                        ),

                        // Tab 2: Water Level Sensor View
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(32.0),
                            child: Text(
                              'Konten Water Level Sensor',
                              style: TextStyle(color: Color(0xFF64748B)),
                            ),
                          ),
                        ),
                      ],
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

import 'package:flutter/material.dart';

import 'widgets/traffic_header.dart';
import 'widgets/traffic_tab_pills.dart';
import 'widgets/lalin_sub_toggle.dart';
import 'widgets/lalin_filter_bar.dart';
import 'widgets/lalin_gate_category_tabs.dart';
import 'widgets/lalin_gauge_card.dart';
import 'widgets/traffic_counting_card.dart';
import 'widgets/lalin_bar_chart_card.dart';

// Reusable Dashboard Widgets
import '../../dashboard/presentation/dashboard_screen.dart';
import '../../dashboard/presentation/widgets/floating_side_button.dart';
import '../../dashboard/presentation/widgets/custom_bottom_nav_bar.dart';

class LalinPerJamScreen extends StatefulWidget {
  const LalinPerJamScreen({super.key});

  @override
  State<LalinPerJamScreen> createState() => _LalinPerJamScreenState();
}

class _LalinPerJamScreenState extends State<LalinPerJamScreen> {
  // State 1: Sub Toggle (0 = GERBANG TOL, 1 = TRAFFIC COUNTING)
  int _selectedSubToggle = 0;

  // State 2: View Mode (0 = Gauge/Speedometer, 1 = Bar Chart)
  int _selectedViewMode = 0;

  // State 3: Gate Category (0 = Gerbang Utama, 1 = Gerbang Lainnya)
  int _selectedGateCategory = 0;

  // Data Dummy 1: Gauge Gerbang Tol (Gambar 1)
  final List<Map<String, dynamic>> gateList = [
    {
      'title': 'Keluar Jakarta (Cikatama 1 + Kalitama 1 + Kalihurip 1)',
      'totalCount': '2630',
      'percent': 0.65,
    },
    {
      'title':
          'Masuk Jakarta (Cikatama 2 + Kalihurip 2 + Kalitama 2) - Kalita...',
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
  ];

  // Data Dummy 2: Traffic Counting (Gambar 2)
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

  // Data Dummy 3: Bar Chart Per Jam (Gambar 3)
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
    {'time': '17:00', 'count': 5620},
    {'time': '18:00', 'count': 5120},
    {'time': '19:00', 'count': 4210},
    {'time': '20:00', 'count': 3120},
    {'time': '21:00', 'count': 2040},
    {'time': '22:00', 'count': 1280},
    {'time': '23:00', 'count': 740},
  ];

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

                    // Sub Toggle (GERBANG TOL vs TRAFFIC COUNTING)
                    LalinSubToggle(
                      selectedIndex: _selectedSubToggle,
                      onChanged: (index) {
                        setState(() {
                          _selectedSubToggle = index;
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    // Filter Bar (Semua Ruas & Report Lalu Lintas)
                    const LalinFilterBar(),
                    const SizedBox(height: 16),

                    // LOGIKA PERPINDAHAN MOCKUP FIGMA:
                    if (_selectedSubToggle == 0) ...[
                      // --- MODE 1 & 3: GERBANG TOL ---
                      LalinGateCategoryTabs(
                        selectedIndex: _selectedGateCategory,
                        selectedViewMode: _selectedViewMode,
                        onCategoryChanged: (categoryIndex) {
                          setState(() {
                            _selectedGateCategory = categoryIndex;
                          });
                        },
                        onViewModeChanged: (modeIndex) {
                          setState(() {
                            _selectedViewMode = modeIndex;
                          });
                        },
                      ),
                      const SizedBox(height: 16),

                      if (_selectedViewMode == 0) ...[
                        // MOCKUP 1: Gauge View (2 Kolom)
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: gateList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
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
                      ] else ...[
                        // MOCKUP 3: Chart View (Bar Chart Per Jam)
                        LalinBarChartCard(
                          title: 'GT CIKAMPEK UTAMA 1',
                          hourlyData: cikampekUtama1Data,
                        ),
                        const SizedBox(height: 16),
                        LalinBarChartCard(
                          title: 'GT CIKAMPEK UTAMA 2',
                          hourlyData: cikampekUtama2Data,
                        ),
                      ],
                    ] else ...[
                      // --- MODE 2: TRAFFIC COUNTING (Gambar 2) ---
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
                    ],

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

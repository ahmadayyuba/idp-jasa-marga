import 'package:flutter/material.dart';

import 'widgets/traffic_header.dart';
import 'widgets/traffic_tab_pills.dart';
import 'widgets/management_lcs_filter_card.dart';
import 'widgets/management_lcs_card.dart';
import 'widgets/detail_lcs_dialog.dart';
// Reusable Dashboard Widgets
import '../../dashboard/presentation/dashboard_screen.dart';
import '../../dashboard/presentation/widgets/floating_side_button.dart';
import '../../dashboard/presentation/widgets/custom_bottom_nav_bar.dart';

class ManagementLcsScreen extends StatelessWidget {
  const ManagementLcsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data Dummy Titik LCS sesuai Figma Mockup
    final List<Map<String, dynamic>> lcsList = [
      {
        'locationCode': 'CKP KM 71+200 A',
        'locationSub': 'Jakarta-Cikampek (Jalur A)',
        'ruasText': 'Jakarta-Cikampek',
        'jalurText': 'A',
        'isOnline': true,
        'laneList': [
          LaneSignItem(laneLabel: 'L1', isOpen: true),
          LaneSignItem(laneLabel: 'L2', isOpen: true),
          LaneSignItem(laneLabel: 'L3', isOpen: true),
        ],
      },
      {
        'locationCode': 'CKP KM 71+200 B',
        'locationSub': 'Jakarta-Cikampek (Jalur B)',
        'ruasText': 'Jakarta-Cikampek',
        'jalurText': 'B',
        'isOnline': true,
        'laneList': [
          LaneSignItem(laneLabel: 'L1', isOpen: true),
          LaneSignItem(laneLabel: 'L2', isOpen: true),
          LaneSignItem(laneLabel: 'L3', isOpen: true),
        ],
      },
      {
        'locationCode': 'CKP KM 46+000 A',
        'locationSub': 'Jakarta-Cikampek (Jalur A)',
        'ruasText': 'Jakarta-Cikampek',
        'jalurText': 'A',
        'isOnline': true,
        'laneList': [
          LaneSignItem(laneLabel: 'L1', isOpen: true),
          LaneSignItem(laneLabel: 'L2', isOpen: true),
          LaneSignItem(laneLabel: 'L3', isOpen: true),
          LaneSignItem(laneLabel: 'L4', isOpen: false),
        ],
      },
      {
        'locationCode': 'CKP KM 46+500 A',
        'locationSub': 'Jakarta-Cikampek (Jalur A)',
        'ruasText': 'Jakarta-Cikampek',
        'jalurText': 'A',
        'isOnline': true,
        'laneList': [
          LaneSignItem(laneLabel: 'L1', isOpen: true),
          LaneSignItem(laneLabel: 'L2', isOpen: true),
          LaneSignItem(laneLabel: 'L3', isOpen: true),
          LaneSignItem(laneLabel: 'L4', isOpen: true),
        ],
      },
      {
        'locationCode': 'CKP KM 70+400 A',
        'locationSub': 'Jakarta-Cikampek (Jalur A)',
        'ruasText': 'Jakarta-Cikampek',
        'jalurText': 'A',
        'isOnline': true,
        'laneList': [
          LaneSignItem(laneLabel: 'L1', isOpen: true),
          LaneSignItem(laneLabel: 'L2', isOpen: true),
          LaneSignItem(laneLabel: 'L3', isOpen: false),
        ],
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

                    // Navigation Tab Pills (Management LCS = activeIndex 7)
                    const TrafficTabPills(activeIndex: 7),
                    const SizedBox(height: 16),

                    // Filter Card
                    ManagementLcsFilterCard(totalTitik: lcsList.length),
                    const SizedBox(height: 16),

                    // List Cards Management LCS
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: lcsList.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final item = lcsList[index];
                        final List<LaneSignItem> lanes = item['laneList'];

                        return ManagementLcsCard(
                          locationCode: item['locationCode'],
                          locationSub: item['locationSub'],
                          isOnline: item['isOnline'],
                          laneList: lanes,
                          onDetailTap: () {
                            // Menampilkan dialog modal Detail Sinyal LCS saat diklik
                            DetailLcsDialog.show(
                              context,
                              title:
                                  'Detail Sinyal LCS ${item['locationCode']}',
                              ruasText: 'Jakarta-Cikampek',
                              jalurText: 'A',
                              gantryList: lanes.map((lane) {
                                final labelIndex = lane.laneLabel.replaceAll(
                                  'L',
                                  '',
                                );
                                return LcsGantryStatus(
                                  laneLabel: 'Lajur $labelIndex',
                                  isOpen: lane.isOpen,
                                );
                              }).toList(),
                            );
                          },
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

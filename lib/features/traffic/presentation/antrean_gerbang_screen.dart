import 'package:flutter/material.dart';
import 'package:idp_jasa_marga/features/traffic/presentation/widgets/traffic_tab_pills.dart';

import './widgets/traffic_header.dart';
import './widgets/antrean_direction_pills.dart';
import './widgets/antrean_gauge_card.dart';

import '../../dashboard/presentation/widgets/floating_side_button.dart';
import '../../dashboard/presentation/widgets/custom_bottom_nav_bar.dart';

class AntreanGerbangScreen extends StatelessWidget {
  const AntreanGerbangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> gerbangList = [
      {
        'title': 'Ciawi 1 (A)',
        'distance': '1000M',
        'statusText': 'Cukup Padat',
        'statusColor': const Color(0xFFF97316),
        'needlePercent': 0.72,
      },
      {
        'title': 'Cililitan 2 (A)',
        'distance': '500M',
        'statusText': 'Sedikit Padat',
        'statusColor': const Color(0xFFF59E0B),
        'needlePercent': 0.48,
      },
      {
        'title': 'Halim Utama (A)',
        'distance': '1200M',
        'statusText': 'Cukup Padat',
        'statusColor': const Color(0xFFF97316),
        'needlePercent': 0.76,
      },
      {
        'title': 'Cibubur 1 (A)',
        'distance': '400M',
        'statusText': 'Sedikit Padat',
        'statusColor': const Color(0xFFF59E0B),
        'needlePercent': 0.42,
      },
      {
        'title': 'Kapuk (A)',
        'distance': '900M',
        'statusText': 'Cukup Padat',
        'statusColor': const Color(0xFFF97316),
        'needlePercent': 0.68,
      },
      {
        'title': 'Senayan (A)',
        'distance': '200M',
        'statusText': 'Lancar',
        'statusColor': const Color(0xFF10B981),
        'needlePercent': 0.20,
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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    TrafficHeader(
                      onBack:  () => Navigator.of(context),
                      onMenuTap: () {}, 
                      onRefreshTap: () {},
                      ),
                      const SizedBox(height: 16),
                      const TrafficTabPills(),
                      const SizedBox(height: 20),
                    const Text(
                      'Antrian Gerbang Tol',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Direction Filter Pill
                    AntreanDirectionPills(onChanged: (index) {}),
                    const SizedBox(height: 20),

                    // Grid 2 Kolom Card Gauge
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: gerbangList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.92,
                      ),
                      itemBuilder: (context, index) {
                        final item = gerbangList[index];
                        return AntreanGaugeCard(
                          title: item['title'],
                          distance: item['distance'],
                          statusText: item['statusText'],
                          statusColor: item['statusColor'],
                          needlePercent: item['needlePercent'],
                        );
                      },
                    ),
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
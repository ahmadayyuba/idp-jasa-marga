import 'package:flutter/material.dart';

import 'widgets/cctv_header.dart';
import 'widgets/cctv_ruas_card.dart';
import './cctv_segment_screen.dart';

// Reusable Dashboard Widgets
import '../../features/dashboard/presentation/widgets/floating_side_button.dart';
import '../../features/dashboard/presentation/widgets/custom_bottom_nav_bar.dart';
import '../../core/constants/app_colors.dart';

class CctvRuasScreen extends StatefulWidget {
  const CctvRuasScreen({super.key});

  @override
  State<CctvRuasScreen> createState() => _CctvRuasScreenState();
}

class _CctvRuasScreenState extends State<CctvRuasScreen> {
  final List<Map<String, String>> _ruasData = [
    {'title': 'JAGORAWI', 'subtitle': 'JAKARTA - BOGOR - CIAWI'},
    {'title': 'DALAM KOTA', 'subtitle': 'CAWANG - TOMANG - PLUIT'},
    {'title': 'SEDYATMO', 'subtitle': 'PROF. DR. IR. SOEDIJATMO'},
    {'title': 'JAKARTA - CIKAMPEK', 'subtitle': 'JAKARTA - CIKAMPEK ELEVATED'},
    {'title': 'TOL LINGKAR LUAR JAKARTA', 'subtitle': 'JORR NON S & JORR S'},
  ];

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
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    const CctvHeader(),
                    const SizedBox(height: 20),

                    // List Render
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _ruasData.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),

                      // 1. Hapus tanda "=>" di sini, cukup gunakan "{"
                      itemBuilder: (context, index) {
                        final ruas = _ruasData[index];
                        return CctvRuasCard(
                          title: ruas['title']!,
                          subtitle: ruas['subtitle']!,
                          onTap: () {
                            // 👇 Navigasi langsung ke CctvSegmentScreen membawa nama ruas
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    CctvSegmentScreen(ruasName: ruas['title']!),
                              ),
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
                bottom: MediaQuery.of(context).size.height * 0.015,
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

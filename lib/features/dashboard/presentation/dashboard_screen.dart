import 'package:flutter/material.dart';

import 'widgets/header_profile_section.dart';
import 'widgets/traffic_summary_card.dart';
import 'widgets/feature_menu_grid.dart';
import 'widgets/floating_side_button.dart';
import 'widgets/custom_bottom_nav_bar.dart';
import 'widgets/notifications/notification_bottom_sheet.dart';
import 'widgets/settings/settings_bottom_sheet.dart';
import '../../auth/presentation/login_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
                    HeaderProfileSection(
                      userName: 'Anggun Windari',
                      onNotificationTap: () {
                        NotificationBottomSheet.show(context);
                      },
                      onFilterTap: () {
                        SettingsBottomSheet.show(context);
                      },
                      onLogoutTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    const TrafficSummaryCard(),
                    const SizedBox(height: 20),
                    const SizedBox(height: 24),
                    const FeatureMenuGrid(),
                    const SizedBox(height: 80),
                  ],
                ),
              ),

              Positioned(
                right: 0,
                bottom: MediaQuery.sizeOf(context).height * 0.015,
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

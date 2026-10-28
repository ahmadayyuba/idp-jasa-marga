import 'package:flutter/material.dart';

// Widget Dashboard Existing
import 'widgets/header_profile_section.dart';
import 'widgets/traffic_summary_card.dart';
import 'widgets/category_filter_pills.dart';

// Grids
import 'widgets/feature_menu_grid.dart';
import 'widgets/peralatan_menu_grid.dart';

import 'widgets/custom_bottom_nav_bar.dart';

import 'widgets/notifications/notification_bottom_sheet.dart';
import 'widgets/settings/settings_bottom_sheet.dart';
import '../../auth/presentation/login_screen.dart';
import 'widgets/pemeliharaan_menu_grid.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/session/auth_session_manager.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _activeCategoryIndex = 0;

  /// Ambil nama dari session, fallback ke 'Anggun Windari'
  String get _displayName =>
      AuthSessionManager.instance.currentUser?.fullName ?? 'Anggun Windari';

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderProfileSection(
                      userName: _displayName,
                      onNotificationTap: () {
                        NotificationBottomSheet.show(context);
                      },
                      onFilterTap: () {
                        SettingsBottomSheet.show(context);
                      },
                      onLogoutTap: () {
                        AuthSessionManager.instance.logout();
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
                    const SizedBox(height: 24),

                    // Pill selector kategori menu
                    CategoryFilterPills(
                      activeIndex: _activeCategoryIndex,
                      onCategoryChanged: (index) {
                        setState(() {
                          _activeCategoryIndex = index;
                        });
                      },
                    ),
                    const SizedBox(height: 24),

                    // Render grid sesuai dengan kategori yang dipilih
                    _buildActiveGrid(),

                    const SizedBox(height: 96),
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

  /// Render grid berdasarkan kategori aktif
  Widget _buildActiveGrid() {
    switch (_activeCategoryIndex) {
      case 0:
        return const FeatureMenuGrid(); // Grid Lalu Lintas
      case 1:
        return const PemeliharaanMenuGrid(); // Grid Pemeliharaan
      case 2:
        return const PeralatanMenuGrid(); // Grid Peralatan
      default:
        return const FeatureMenuGrid();
    }
  }
}

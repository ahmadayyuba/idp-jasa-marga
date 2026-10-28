import 'package:flutter/material.dart';

import '../../../traffic/presentation/antrean_gerbang_screen.dart';
import '../../../traffic/presentation/realtime_traffic_screen.dart';
import '../../../../cctv/presentation/cctv_ruas_screen.dart';
import '../dashboard_screen.dart';
import '../../../../core/constants/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int activeIndex; // 0: Home, 1: CCTV, 2: Map, 3: Antrean, 4: Traffic

  const CustomBottomNavBar({
    super.key,
    this.activeIndex = 0,
  });

  void _navigateTo(BuildContext context, int targetIndex, Widget targetScreen) {
    if (activeIndex == targetIndex) return; // Guard: Cegah push berulang di tab aktif
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => targetScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.home_rounded,
            label: 'Home',
            isActive: activeIndex == 0,
            onTap: () => _navigateTo(context, 0, const DashboardScreen()),
          ),
          _buildNavItem(
            icon: Icons.videocam_outlined,
            label: 'CCTV',
            isActive: activeIndex == 1,
            onTap: () => _navigateTo(context, 1, const CctvRuasScreen()),
          ),
          // Center Floating Map Icon
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.accentBlue,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.white, width: 3),
            ),
            child: const Icon(Icons.map_outlined, color: AppColors.white, size: 26),
          ),
          _buildNavItem(
            icon: Icons.grid_view_outlined,
            label: 'Antrian\nGerbang',
            isActive: activeIndex == 3,
            onTap: () => _navigateTo(context, 3, const AntreanGerbangScreen()),
          ),
          _buildNavItem(
            icon: Icons.show_chart_rounded,
            label: 'Realtime\nTraffic',
            isActive: activeIndex == 4,
            onTap: () => _navigateTo(context, 4, const RealtimeTrafficScreen()),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 22,
              color: isActive ? AppColors.primaryActive : AppColors.grey,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 9,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                color: isActive ? AppColors.primaryActive : AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
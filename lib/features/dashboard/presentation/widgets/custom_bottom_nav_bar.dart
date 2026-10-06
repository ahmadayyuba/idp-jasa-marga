import 'package:flutter/material.dart';
import '../../../traffic/presentation/antrean_gerbang_screen.dart';
import '../../../traffic/presentation/realtime_traffic_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
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
            isActive: true,
            onTap: () {},
          ),
          _buildNavItem(
            icon: Icons.videocam_outlined,
            label: 'CCTV',
            isActive: false,
            onTap: () {},
          ),

          // Center Floating Action Icon
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFF005BAC),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: const Icon(Icons.map_outlined, color: Colors.white, size: 26),
          ),

          // Tombol Navigasi Antrian Gerbang
          _buildNavItem(
            icon: Icons.grid_view_outlined,
            label: 'Antrian\nGerbang',
            isActive: false,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AntreanGerbangScreen(),
                ),
              );
            },
          ),

          // Tombol Navigasi Realtime Traffic
          _buildNavItem(
            icon: Icons.show_chart_rounded,
            label: 'Realtime\nTraffic',
            isActive: false,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RealtimeTrafficScreen(),
                ),
              );
            },
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
              color: isActive ? const Color(0xFF003399) : Colors.grey,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 9,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                color: isActive ? const Color(0xFF003399) : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
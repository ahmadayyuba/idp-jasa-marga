import 'package:flutter/material.dart';

import '../../../traffic/traffic_dashboard_screen.dart';
import '../realtime_traffic_screen.dart';
import '../antrean_gerbang_screen.dart';
import '../lalin_per_jam_screen.dart';

class TrafficTabPills extends StatelessWidget {
  final int activeIndex;

  const TrafficTabPills({
    super.key,
    required this.activeIndex, 
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildPill(context, 'Dashboard', 0, const TrafficDashboardScreen()),
          const SizedBox(width: 8),
          _buildPill(context, 'Realtime', 1, const RealtimeTrafficScreen()),
          const SizedBox(width: 8),
          _buildPill(context, 'Antrean Gerbang', 2, const AntreanGerbangScreen()),
          const SizedBox(width: 8),
          _buildPill(context, 'Lalin Per Jam', 3, const LalinPerJamScreen()),
        ],
      ),
    );
  }

Widget _buildPill(
    BuildContext context,
    String label,
    int index,
    Widget targetScreen,
  ) {
    final bool isActive = activeIndex == index;

    return GestureDetector(
      onTap: () {
        if (!isActive) {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => targetScreen,
              transitionDuration: Duration.zero, // Biar ga ada delay/flicker animasi
              reverseTransitionDuration: Duration.zero,
            ),
          );
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF003399) : Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            if (!isActive)
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.white : const Color(0xFF475569),
          ),
        ),
      ),
    );
  }
}
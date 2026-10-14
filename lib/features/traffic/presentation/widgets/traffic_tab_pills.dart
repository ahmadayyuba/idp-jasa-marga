import 'package:flutter/material.dart';
import '../../../../core/routes/app_routes.dart'; // Import AppRoutes

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
          _buildPill(context, 'Dashboard', 0, AppRoutes.trafficDashboard),
          const SizedBox(width: 8),
          _buildPill(context, 'Realtime', 1, AppRoutes.realtimeTraffic),
          const SizedBox(width: 8),
          _buildPill(context, 'Antrean Gerbang', 2, AppRoutes.antreanGerbang),
          const SizedBox(width: 8),
          _buildPill(context, 'Lalin Per Jam', 3, AppRoutes.lalinPerJam),
          const SizedBox(width: 8),
          _buildPill(context, 'Gangguan Lalin', 4, AppRoutes.gangguanLalin),
          const SizedBox(width: 8),
          _buildPill(context, 'Kinerja Lalin', 5, AppRoutes.kinerjaLalin),
          const SizedBox(width: 8),
          _buildPill(context, 'Traffic', 6, AppRoutes.trafficScreen),
          const SizedBox(width: 8),
          _buildPill(context, 'Management LCS', 7, AppRoutes.managementLcs),
        ],
      ),
    );
  }

  Widget _buildPill(
    BuildContext context,
    String label,
    int index,
    String routeName,
  ) {
    final bool isActive = activeIndex == index;

    return GestureDetector(
      onTap: () {
        if (!isActive) {
          Navigator.of(context).pushReplacementNamed(routeName);
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
import 'package:flutter/material.dart';

import 'feature_menu_item.dart';
import '../../../../features/traffic/traffic_dashboard_screen.dart';
import '../../../../features/traffic/presentation/realtime_traffic_screen.dart';
import '../../../traffic/presentation/antrean_gerbang_screen.dart';
import '../../../traffic/presentation/lalin_per_jam_screen.dart';

class FeatureMenuGrid extends StatelessWidget {
  const FeatureMenuGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {'icon': Icons.bar_chart_rounded, 'label': 'Dashboard\nLalu Lintas'},
      {'icon': Icons.speed_rounded, 'label': 'Realtime\nTraffic'},
      {'icon': Icons.grid_view_rounded, 'label': 'Antrian\nGerbang'},
      {'icon': Icons.access_time_rounded, 'label': 'Lalin Per\nJam'},
      {'icon': Icons.warning_amber_rounded, 'label': 'Gangguan\nLalin'},
      {'icon': Icons.trending_up_rounded, 'label': 'Kinerja\nLalin'},
      {'icon': Icons.traffic_rounded, 'label': 'Traffic'},
      {'icon': Icons.alt_route_rounded, 'label': 'Management\nLCS'},
      {'icon': Icons.camera_alt_outlined, 'label': 'ETLE &\nWIM'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 20,
        childAspectRatio: 0.75,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        return FeatureMenuItem(
          icon: menuItems[index]['icon'],
          label: menuItems[index]['label'],
          onTap: () {
            if (index == 0) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TrafficDashboardScreen(),
                ),
              );
            } else if (index == 1) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RealtimeTrafficScreen(),
                ),
              );
            } else if (index == 2) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AntreanGerbangScreen(),
                ),
              );
            } else if (index == 3) {
              // Menu 4: Lalin Per Jam
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LalinPerJamScreen(),
                ),
              );
            }
          },
        );
      },
    );
  }
}

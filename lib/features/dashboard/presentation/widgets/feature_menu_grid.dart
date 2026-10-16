import 'package:flutter/material.dart';

import 'feature_menu_item.dart';
import '../../../../core/routes/app_routes.dart';

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
            switch (index) {
              case 0:
                Navigator.of(context).pushNamed(AppRoutes.trafficDashboard);
                break;
              case 1:
                Navigator.of(context).pushNamed(AppRoutes.realtimeTraffic);
                break;
              case 2:
                Navigator.of(context).pushNamed(AppRoutes.antreanGerbang);
                break;
              case 3:
                Navigator.of(context).pushNamed(AppRoutes.lalinPerJam);
                break;
              case 4:
                Navigator.of(context).pushNamed(AppRoutes.gangguanLalin);
                break;
              case 5:
                Navigator.of(context).pushNamed(AppRoutes.kinerjaLalin);
                break;
              case 6:
                Navigator.of(context).pushNamed(AppRoutes.trafficScreen);
                break;
              case 7:
                Navigator.of(context).pushNamed(AppRoutes.managementLcs);
                break;
              case 8:
                Navigator.of(context).pushNamed(AppRoutes.etleWimScreen);
                break;
              default:
                // Handle default case if needed
                break;
            }
          },
        );
      },
    );
  }
}

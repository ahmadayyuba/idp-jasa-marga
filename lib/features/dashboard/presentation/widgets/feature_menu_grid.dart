import 'package:flutter/material.dart';
import 'feature_menu_item.dart';

class FeatureMenuGrid extends StatelessWidget {
  const FeatureMenuGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems =  [
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
        mainAxisExtent: 100, //di cek apakah nanti designnya bakal sedikit berantakan
        childAspectRatio: 0.75,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        return FeatureMenuItem(
          icon: menuItems[index]['icon'],
          label: menuItems[index]['label'],
          onTap: (){}
          );
      },
    );
  }
}

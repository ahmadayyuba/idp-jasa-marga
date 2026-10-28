import 'package:flutter/material.dart';

import 'feature_menu_item.dart';
// 1. Pastikan import AppRoutes ini ada dan jalurnya benar
import '../../../../core/routes/app_routes.dart';

class PeralatanMenuGrid extends StatelessWidget {
  const PeralatanMenuGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Setiap item diberi peta 'tabIndex' yang tepat
    final List<Map<String, dynamic>> menuItems = [
      {'icon': Icons.bar_chart_rounded, 'label': 'Summary', 'tabIndex': 0},
      {'icon': Icons.show_chart_rounded, 'label': 'PWO-RWGR', 'tabIndex': 1},
      {'icon': Icons.grid_view_rounded, 'label': 'Matrix\nCCTV', 'tabIndex': 2},
      {
        'icon': Icons.desktop_windows_outlined,
        'label': 'Matrix\nDMS',
        'tabIndex': 3,
      },
      {
        'icon': Icons.videocam_rounded,
        'label': 'Management\nCCTV',
        'tabIndex': 4,
      },
      {
        'icon': Icons.insert_chart_outlined,
        'label': 'Report\nStatus CCTV',
        'tabIndex': 5,
      },
      {
        'icon': Icons.my_location_rounded,
        'label': 'Kendaraan\nOperasional',
        'tabIndex': 6,
      },
      {'icon': Icons.build_rounded, 'label': 'Monitoring\nAlat', 'tabIndex': 8},
      {
        'icon': Icons.control_camera_rounded,
        'label': 'CCTV\nPTZ',
        'tabIndex': 10,
      },
      {
        'icon': Icons.more_horiz_rounded,
        'label': 'Lainnya\nMenu',
        'tabIndex': 0,
      },
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
            // 3. Navigasi memanggil rute Peralatan milikmu
            Navigator.pushNamed(
              context,
              AppRoutes.peralatanDashboard,
              arguments: menuItems[index]['tabIndex'],
            );
          },
        );
      },
    );
  }
}

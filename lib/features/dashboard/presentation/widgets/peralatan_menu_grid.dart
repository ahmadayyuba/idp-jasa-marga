import 'package:flutter/material.dart';

// Import komponen item menu yang sama persis seperti yang dipakai di Lalu Lintas
import 'feature_menu_item.dart'; 

class PeralatanMenuGrid extends StatelessWidget {
  const PeralatanMenuGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // List menu khusus Peralatan sesuai Figma
    final List<Map<String, dynamic>> menuItems = [
      {'icon': Icons.bar_chart_rounded, 'label': 'Summary'},
      {'icon': Icons.show_chart_rounded, 'label': 'PWO-RWGR'},
      {'icon': Icons.grid_view_rounded, 'label': 'Matrix\nCCTV'},
      {'icon': Icons.desktop_windows_outlined, 'label': 'Matrix\nDMS'},
      {'icon': Icons.videocam_rounded, 'label': 'Management\nCCTV'},
      {'icon': Icons.insert_chart_outlined, 'label': 'Report\nStatus CCTV'},
      {'icon': Icons.my_location_rounded, 'label': 'Kendaraan\nOperasional'},
      {'icon': Icons.build_rounded, 'label': 'Monitoring\nAlat'},
      {'icon': Icons.control_camera_rounded, 'label': 'CCTV\nPTZ'},
      {'icon': Icons.more_horiz_rounded, 'label': 'Lainnya\nMenu'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12, // Jarak antar kolom
        mainAxisSpacing: 20,  // Jarak antar baris
        childAspectRatio: 0.75,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        return FeatureMenuItem(
          icon: menuItems[index]['icon'],
          label: menuItems[index]['label'],
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Menu ${menuItems[index]['label']} diklik')),
            );
          },
        );
      },
    );
  }
}
import 'package:flutter/material.dart';

import '../../../../core/routes/app_routes.dart';
import 'feature_menu_item.dart';

class PemeliharaanMenuGrid extends StatelessWidget {
  const PemeliharaanMenuGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {'icon': Icons.bar_chart_rounded, 'label': 'Summary'},
      {'icon': Icons.engineering_rounded, 'label': 'Data\nPemeliharaan'},
      {'icon': Icons.water_drop_outlined, 'label': 'Water Level\nSensor'},
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
                Navigator.of(context).pushNamed(AppRoutes.maintenanceSummary);
                break;
              case 1:
                Navigator.of(context).pushNamed(AppRoutes.dataPemeliharaan);
                break;
              case 2:
                Navigator.of(context).pushNamed(AppRoutes.waterLevelSensor);
                break;
            }
          },
        );
      },
    );
  }
}

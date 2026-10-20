import 'package:flutter/material.dart';

import 'widgets/water_level_hero_card.dart';
import 'widgets/water_level_filter_chips.dart';
import 'widgets/water_level_sensor_card.dart';

class WaterLevelSensorView extends StatelessWidget {
  const WaterLevelSensorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WaterLevelHeroCard(),
        const SizedBox(height: 16),

        const WaterLevelFilterChips(),
        const SizedBox(height: 16),

        const WaterLevelSensorCard(
          idKode: 'SB07',
          title: 'CIKUNIR 8 JORR',
          subtitle: 'Simpang Susun Cikunir KM 45',
          waterLevelCm: 50,
          capacityPercent: 25,
          signalStatus: '99% (LTE IoT)',
          updateTime: '2026-08-27 23:20:11',
        ),
        const SizedBox(height: 16),

        const WaterLevelSensorCard(
          idKode: 'SB08',
          title: 'GT SADANG PBLY',
          subtitle: 'Gerbang Tol Sadang KM 76',
          waterLevelCm: 15,
          capacityPercent: 8,
          signalStatus: '95% (LTE IoT)',
          updateTime: '2026-08-27 23:25:57',
        ),
      ],
    );
  }
}

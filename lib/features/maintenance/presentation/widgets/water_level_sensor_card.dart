import 'package:flutter/material.dart';

import 'cctv_live_dialog.dart';

class WaterLevelSensorCard extends StatelessWidget {
  final String idKode;
  final String title;
  final String subtitle;
  final int waterLevelCm;
  final int capacityPercent;
  final String signalStatus;
  final String updateTime;

  const WaterLevelSensorCard({
    super.key,
    required this.idKode,
    required this.title,
    required this.subtitle,
    required this.waterLevelCm,
    required this.capacityPercent,
    required this.signalStatus,
    required this.updateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: Header Badges & Live CCTV Button
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  idKode,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCFCE7),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFF86EFAC)),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.circle, size: 6, color: Color(0xFF16A34A)),
                    SizedBox(width: 4),
                    Text(
                      'NORMAL',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF16A34A),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              OutlinedButton.icon(
                onPressed: () {
                  CctvLiveDialog.show(
                    context,
                    locationName: title,
                    cctvName: 'EWS OR CKNR 8 JORR',
                    timestamp: '2026-08-27 23:50:12',
                  );
                },
                icon: const Icon(Icons.videocam_rounded, size: 14),
                label: const Text('Live CCTV', style: TextStyle(fontSize: 10)),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF2563EB),
                  side: const BorderSide(color: Color(0xFFBFDBFE)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 0,
                  ),
                  minimumSize: const Size(0, 28),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Row 2: Location Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
          ),
          const SizedBox(height: 16),

          // Row 3: Status Boxes & Tank Graphic
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kolom Kiri: Cuaca & Pompa
              Expanded(
                child: Column(
                  children: [
                    _buildInfoBox(
                      icon: Icons.wb_sunny_rounded,
                      iconColor: const Color(0xFFF59E0B),
                      title: 'TIDAK HUJAN',
                      subtitle: 'Presipitasi 0.0 mm/jam',
                    ),
                    const SizedBox(height: 12),
                    _buildInfoBox(
                      icon: Icons.power_settings_new_rounded,
                      iconColor: const Color(0xFF94A3B8),
                      title: 'POMPA STANDBY',
                      subtitle: 'Mode: AUTO (OFF)',
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),

              // Kolom Kanan: Tangki Air
              _buildWaterTankGraphic(),
            ],
          ),
          const SizedBox(height: 20),

          // Row 4: Legend Bar
          Row(
            children: [
              _buildLegendSegment(
                'NORMAL',
                const Color(0xFF22C55E),
                const Color(0xFFDCFCE7),
              ),
              _buildLegendSegment(
                'SIAGA 1',
                const Color(0xFFEAB308),
                const Color(0xFFFEF9C3),
              ),
              _buildLegendSegment(
                'SIAGA 2',
                const Color(0xFFF97316),
                const Color(0xFFFFEDD5),
              ),
              _buildLegendSegment(
                'SIAGA 3',
                const Color(0xFFEF4444),
                const Color(0xFFFEE2E2),
              ),
              _buildLegendSegment(
                'AWAS',
                const Color(0xFF991B1B),
                const Color(0xFFFECACA),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Row 5: Signal & Update Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.bolt_rounded,
                    size: 14,
                    color: Color(0xFFF59E0B),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Signal: $signalStatus',
                    style: const TextStyle(
                      fontSize: 9,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
              Text(
                'Update $updateTime',
                style: const TextStyle(fontSize: 9, color: Color(0xFF94A3B8)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24, color: iconColor),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 9, color: Color(0xFF64748B)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaterTankGraphic() {
    return Container(
      width: 100,
      height: 130,
      decoration: BoxDecoration(
        color: const Color(0xFF334155), // Background Gelap Tangki
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Animasi / Warna Air (Gradient Hijau/Teal)
          FractionallySizedBox(
            heightFactor: capacityPercent / 100, // Menyesuaikan dengan persen
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0D9488), Color(0xFF34D399)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),

          // Tick Marks di kiri
          Positioned(
            left: 8,
            top: 10,
            bottom: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                6,
                (index) =>
                    Container(width: 6, height: 2, color: Colors.white30),
              ),
            ),
          ),

          // Teks Level di tengah
          Positioned(
            right: 12,
            top: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '$waterLevelCm',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 2),
                    const Text(
                      'cm',
                      style: TextStyle(fontSize: 10, color: Colors.white70),
                    ),
                  ],
                ),
                Text(
                  '$capacityPercent% Kapasitas',
                  style: const TextStyle(fontSize: 8, color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendSegment(String label, Color textColor, Color bgColor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 2),
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 7,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

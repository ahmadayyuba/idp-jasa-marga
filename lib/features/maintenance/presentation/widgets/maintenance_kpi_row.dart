import 'package:flutter/material.dart';

class MaintenanceKpiRow extends StatelessWidget {
  final int totalProyek;
  final int totalProses;
  final int totalSelesai;

  const MaintenanceKpiRow({
    super.key,
    required this.totalProyek,
    required this.totalProses,
    required this.totalSelesai,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildKpiCard(
            title: 'Total Proyek',
            value: '$totalProyek Titik',
            bgColor: Colors.white,
            valueColor: const Color(0xFF0F2B5B),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildKpiCard(
            title: 'Proses',
            value: '$totalProses Titik',
            bgColor: const Color(0xFFFEF3C7),
            valueColor: const Color(0xFFD97706),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildKpiCard(
            title: 'Selesai',
            value: '$totalSelesai Titik',
            bgColor: const Color(0xFFDCFCE7),
            valueColor: const Color(0xFF16A34A),
          ),
        ),
      ],
    );
  }

  Widget _buildKpiCard({
    required String title,
    required String value,
    required Color bgColor,
    required Color valueColor,
  }) {
    return Container(
      padding:  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black.withOpacity(0.04)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              color: Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          )
        ],
      ),
    );
  }
}

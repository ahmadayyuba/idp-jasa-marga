import 'package:flutter/material.dart';

enum GangguanStatus { dalamPenanganan, belumDitangani, selesai }

class GangguanLalinItemCard extends StatelessWidget {
  final String title;
  final String kmTag;
  final String description;
  final String timeText;
  final String impactText;
  final GangguanStatus status;

  const GangguanLalinItemCard({
    super.key,
    required this.title,
    required this.kmTag,
    required this.description,
    required this.timeText,
    this.impactText = 'Dampak: Lancar',
    required this.status,
  });

  Color get _statusBgColor {
    switch (status) {
      case GangguanStatus.dalamPenanganan:
        return const Color(0xFFFEF08A);
      case GangguanStatus.belumDitangani:
        return const Color(0xFFFFE4E6);
      case GangguanStatus.selesai:
        return const Color(0xFF15803D);
    }
  }

  Color get _statusTextColor {
    switch (status) {
      case GangguanStatus.dalamPenanganan:
        return const Color(0xFFA16207);
      case GangguanStatus.belumDitangani:
        return const Color(0xFFBE123C);
      case GangguanStatus.selesai:
        return const Color(0xFF15803D);
    }
  }

  String get _statusLabel {
    switch (status) {
      case GangguanStatus.dalamPenanganan:
        return 'Dalam Penanganan';
      case GangguanStatus.belumDitangani:
        return 'Belum Ditangani';
      case GangguanStatus.selesai:
        return 'Selesai';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F2B5B),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        kmTag,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF475569),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: _statusBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _statusLabel,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: _statusTextColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Icon(
                      Icons.car_crash_rounded,
                      size: 16,
                      color: Color(0xFFDC2626),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        description,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                impactText,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF10B981),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          Row(
            children: [
              const Icon(Icons.access_time_rounded),
              const SizedBox(width: 6),
              Text(
                timeText,
                style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

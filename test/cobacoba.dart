import 'package:flutter/material.dart';

class LaneSignItem {
  final String laneLabel; // e.g., 'L1', 'L2', 'L3', 'L4'
  final bool isOpen; // true = Panah Hijau (⬇), false = Silang Merah (❌)

  LaneSignItem({required this.laneLabel, required this.isOpen});
}

class ManagementLcsCard extends StatelessWidget {
  final String locationCode;
  final String locationSub;
  final bool isOnline;
  final List<LaneSignItem> laneList;
  final VoidCallback? onDetailTap;

  const ManagementLcsCard({
    super.key,
    required this.locationCode,
    required this.locationSub,
    this.isOnline = true,
    required this.laneList,
    this.onDetailTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row: Icon + Location Code & Subtitle + Online Badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.alt_route_rounded,
                  size: 18,
                  color: Color(0xFF003399),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      locationCode,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F2B5B),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      locationSub,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: isOnline
                      ? const Color(0xFF22C55E)
                      : const Color(0xFF94A3B8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  isOnline ? 'Online' : 'Offline',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Bottom Row: Lanes Indicator & Search Detail Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Lajur Badges
              Expanded(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    Text(
                      '${laneList.length} Lajur:',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF475569),
                      ),
                    ),
                    ...laneList.map((lane) => _buildLaneBadge(lane)),
                  ],
                ),
              ),
              const SizedBox(width: 8),

              // Detail Search Button
              InkWell(
                onTap: onDetailTap,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.search_rounded,
                    size: 18,
                    color: Color(0xFF0F2B5B),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLaneBadge(LaneSignItem lane) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: lane.isOpen ? const Color(0xFFDCFCE7) : const Color(0xFFFEE2E2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${lane.laneLabel}: ',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: lane.isOpen
                  ? const Color(0xFF16A34A)
                  : const Color(0xFFDC2626),
            ),
          ),
          Icon(
            lane.isOpen ? Icons.arrow_downward_rounded : Icons.close_rounded,
            size: 11,
            color: lane.isOpen
                ? const Color(0xFF16A34A)
                : const Color(0xFFDC2626),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class TrafficDetailDialog extends StatelessWidget {
  final String title;
  final String kmInfo;
  final String status;
  final String jalur;
  final String jenisGangguan;
  final String waktu;
  final String durasi;
  final String dampak;
  final VoidCallback onOpenDetail;

  const TrafficDetailDialog({
    super.key,
    this.title = 'Jakarta - Cikampek',
    this.kmInfo = 'KM 50+800 (Cikampek)',
    this.status = 'Dalam Penanganan',
    this.jalur = 'Jalur A • Lajur Bahu & 1',
    this.jenisGangguan = 'Kecelakaan Truk vs Box',
    this.waktu = '2026-09-02 14:35:00',
    this.durasi = '45 Menit',
    this.dampak = 'Kepadatan +1KM',
    required this.onOpenDetail,
  });

  static Future show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => TrafficDetailDialog(
        onOpenDetail: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(24),),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: 
            CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: 
                CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEE2E2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.warning_amber_rounded,
                      color: Color(0xFFEF4444),
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: 
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF003399),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            kmInfo,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.close_rounded,
                    color: Colors.grey,
                    size: 22,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 16),
            const Divider(height: 1, color: Color(0xFFE2E8F0)),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: 
              MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Status Kejadian',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF475569),
                  ),
                ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12,
                    vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEF08A),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFFACC15)),
                    ),
                    child: Text(
                      status,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF854D0E),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFF8FAFC)),
                ),
                child: Column(
                  children: [
                    _buildDetailRow(
                      icon: Icons.alt_route_rounded,
                      label: 'Jalur/ Lajur',
                      value: jalur,
                    ),
                    const Divider(height: 16, color: Color(0xFFF8FAFC)),
                    _buildDetailRow(
                      icon: Icons.directions_car_rounded,
                      label: 'Jenis Gangguan',
                      value: jenisGangguan,
                    ),
                    const Divider(height: 16, color: Color(0xFFF8FAFC)),
                    _buildDetailRow(
                      icon: Icons.access_time_rounded,
                      label: 'Waktu Kejadian',
                      value: waktu,
                    ),
                    const Divider(height: 16, color: Color(0xFFE2E8F0)),
                    _buildDetailRow(
                    icon: Icons.timer_outlined,
                    label: 'Durasi Penanganan:',
                    value: durasi,
                    ),
                    const Divider(height: 16, color: Color(0xFFE2E8F0)),
                    _buildDetailRow(
                    icon: Icons.traffic_rounded,
                    label: 'Dampak Lalin:',
                    value: dampak,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(), 
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: Color(0xFFCBD5E1)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Tutup',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF475569),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: onOpenDetail,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF003399),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_forward_rounded, size: 16, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Buka Gangguan Lalin',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                ],
              ),
            ],
          ),  
        ),
    );
  }

  
  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color(0xFF64748B)),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF64748B),
          ),
        ),
        const Spacer(),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
        ),
      ],
    );
  }
}
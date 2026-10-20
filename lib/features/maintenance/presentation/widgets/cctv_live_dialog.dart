import 'package:flutter/material.dart';

class CctvLiveDialog extends StatelessWidget {
  final String locationName;
  final String cctvName;
  final String timestamp;

  const CctvLiveDialog({
    super.key,
    required this.locationName,
    required this.cctvName,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Icon, Title, and Close Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.videocam_rounded,
                      color: Color(0xFF1E3A8A), // Biru gelap
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      locationName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.close_rounded,
                    color: Color(0xFF64748B),
                    size: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // CCTV Video Player Placeholder
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFF1E293B), // Warna dasar biru gelap/hitam
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: [
                  // Placeholder "Video" Stream (Pita Biru di Tengah)
                  Center(
                    child: Container(
                      width: 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xFF2563EB).withOpacity(0.5),
                            const Color(0xFF1D4ED8).withOpacity(0.8),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Overlay Timestamp (Kiri Atas)
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      color: Colors.black.withOpacity(0.6),
                      child: Text(
                        'EWS-CCTV [LIVE] $timestamp',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: 'monospace', // Font ala timestamp CCTV
                        ),
                      ),
                    ),
                  ),

                  // Overlay Nama CCTV (Kanan Bawah)
                  Positioned(
                    bottom: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      color: Colors.black.withOpacity(0.6),
                      child: Text(
                        cctvName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void show(
    BuildContext context, {
    required String locationName,
    required String cctvName,
    required String timestamp,
  }) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4), // Warna backdrop meredup
      builder: (context) => CctvLiveDialog(
        locationName: locationName,
        cctvName: cctvName,
        timestamp: timestamp,
      ),
    );
  }
}
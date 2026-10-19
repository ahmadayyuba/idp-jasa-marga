import 'package:flutter/material.dart';

class KinerjaRuasCard extends StatelessWidget {
  final String ruasTitle;
  final double vcRatio;
  final String losText;
  final String speedText;

  const KinerjaRuasCard({
    super.key,
    required this.ruasTitle,
    required this.vcRatio,
    required this.losText,
    required this.speedText,
  });

  // Penentuan warna badge berdasarkan nilai V/C Ratio
  Color get _vcBgColor {
    if (vcRatio >= 0.80) {
      return const Color(0xFFFEE2E2); // Merah Muda
    } else if (vcRatio >= 0.65) {
      return const Color(0xFFFEF3C7); // Kuning / Krem
    } else {
      return const Color(0xFFDCFCE7); // Hijau Muda
    }
  }

  Color get _vcTextColor {
    if (vcRatio >= 0.80) {
      return const Color(0xFFDC2626); // Merah
    } else if (vcRatio >= 0.65) {
      return const Color(0xFFD97706); // Oranye/Kuning
    } else {
      return const Color(0xFF16A34A); // Hijau
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
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Nama Ruas & Badge V/C
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  ruasTitle,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F2B5B),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: _vcBgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'V/C: ${vcRatio.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: _vcTextColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Bottom Row: LOS Status & Kecepatan
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                losText,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: _vcTextColor,
                ),
              ),
              Row(
                children: [
                  const Text(
                    'Kec: ',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  Text(
                    speedText,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF003399),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
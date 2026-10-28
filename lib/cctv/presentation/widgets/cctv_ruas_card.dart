import 'package:flutter/material.dart';
import '../../data/models/ruas_model.dart';
import '../../../core/constants/app_colors.dart';

class CctvRuasCard extends StatelessWidget {
  final RuasModel? ruas;
  final String? title;
  final String? subtitle;
  final VoidCallback onTap;

  const CctvRuasCard({
    super.key,
    this.ruas,
    this.title,
    this.subtitle,
    required this.onTap,
  });

  String get displayTitle => ruas?.title ?? title ?? '';
  String get displaySubtitle => ruas?.subtitle ?? subtitle ?? '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100, // Menjaga konsistensi tinggi card
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [AppColors.deepNavy, AppColors.primaryBlue], // Gradient Biru Gelap
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryBlue.withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // Ornamen Abstrak (Garis melengkung tipis)
            Positioned(
              right: -30,
              bottom: -40,
              child: Transform.rotate(
                angle: -0.2,
                child: Container(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: AppColors.white.withValues(alpha: 0.1),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Konten Teks dan Ikon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          displayTitle,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          displaySubtitle,
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppColors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Tombol Ikon Bulat
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.map_rounded, // Menggunakan icon peta mirip desain
                      color: AppColors.darkNavy,
                      size: 24,
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
}
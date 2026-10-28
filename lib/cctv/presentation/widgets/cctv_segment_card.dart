import 'package:flutter/material.dart';
import '../../data/models/segment_model.dart';
import '../../../core/constants/app_colors.dart';

class CctvSegmentCard extends StatelessWidget {
  final SegmentModel? segment;
  final String? title;
  final bool? isAll;
  final VoidCallback onTap;

  const CctvSegmentCard({
    super.key,
    this.segment,
    this.title,
    this.isAll,
    required this.onTap,
  });

  String get displayTitle => segment?.title ?? title ?? '';
  bool get displayIsAll => segment?.isAll ?? isAll ?? false;

  @override
  Widget build(BuildContext context) {
    final effectiveIsAll = displayIsAll;
    final effectiveTitle = displayTitle;

    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: effectiveIsAll ? AppColors.cardLightBlue : AppColors.white,
            borderRadius: BorderRadius.circular(20),
            border: effectiveIsAll
                ? Border.all(color: AppColors.borderLightBlue, width: 1.5)
                : null,
            boxShadow: [
              if (!effectiveIsAll)
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Lingkaran Ikon Kamera
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: effectiveIsAll
                      ? AppColors.primaryBlue
                      : AppColors.iconCircleBg,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.videocam_rounded,
                  color: effectiveIsAll ? AppColors.white : AppColors.primaryBlue,
                  size: 26,
                ),
              ),
              const SizedBox(height: 16),

              // Judul Segment
              Text(
                effectiveTitle,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: effectiveIsAll
                      ? AppColors.primaryBlue
                      : AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

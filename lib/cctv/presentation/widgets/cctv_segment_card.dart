import 'package:flutter/material.dart';

class CctvSegmentCard extends StatelessWidget {
  final String title;
  final bool isAll;
  final VoidCallback onTap;

  const CctvSegmentCard({
    super.key,
    required this.title,
    this.isAll = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isAll ? const Color(0xFFEFF6FF) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: isAll
                ? Border.all(color: const Color(0xFFBFDBFF), width: 1.5)
                : null,
            boxShadow: [
              if (!isAll)
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.03),
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
                  color: isAll
                      ? const Color(0xFF1E3A8A)
                      : const Color(0xFFDBEAFE),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.videocam_rounded,
                  color: isAll ? Colors.white : const Color(0xFF1E3A8A),
                  size: 26,
                ),
              ),
              const SizedBox(height: 16),

              // Judul Segment
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isAll
                      ? const Color(0xFF1E3A8A)
                      : const Color(0xFF0F172A),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

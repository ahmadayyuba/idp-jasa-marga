import 'package:flutter/material.dart';
import '../../data/models/camera_model.dart';
import '../../../core/constants/app_colors.dart';

class CctvMainPlayerCard extends StatelessWidget {
  final CameraModel? camera;
  final String? cameraTitle;
  final String? timestamp;
  final String? directionText;

  const CctvMainPlayerCard({
    super.key,
    this.camera,
    this.cameraTitle,
    this.timestamp,
    this.directionText,
  });

  String get effectiveCameraTitle => camera?.code ?? cameraTitle ?? '';
  String get effectiveTimestamp => camera?.timestamp ?? timestamp ?? '';
  String get effectiveDirection => camera?.direction ?? directionText ?? '';
  bool get effectiveIsLive => camera?.isLive ?? true;

  @override
  Widget build(BuildContext context) {
    final title = effectiveCameraTitle;
    final time = effectiveTimestamp;
    final direction = effectiveDirection;
    final statusText = effectiveIsLive ? '[LIVE]' : '[OFFLINE]';

    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: AppColors.playerBg,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [

          Center(
            child: CustomPaint(
              size: const Size(double.infinity, 220),
              painter: _RoadPainter(),
            ),
          ),

          Positioned(
            top: 12,
            left: 12,
            right: 12,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.black.withValues(alpha: 0.6),
                    ),
                    child: Text(
                      '$title $statusText $time',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.brightBlue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'JASA MARGA',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
              ],
            ),
            ),

            Positioned(
              top: 56,
              left: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.north_east_rounded,
                    color: AppColors.white70,
                    size: 16,
                  ),
                  Text(
                    direction,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white70,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              ),
        ],
      ),
    );
  }
}

// Visual Ilustrasi Jalan Tol Sederhana (Placeholder Video)
class _RoadPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintRoad = Paint()
      ..color = AppColors.playerSurface
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width * 0.45, size.height * 0.3)
      ..lineTo(size.width * 0.55, size.height * 0.3)
      ..lineTo(size.width * 0.85, size.height)
      ..lineTo(size.width * 0.15, size.height)
      ..close();

    canvas.drawPath(path, paintRoad);

    final paintLine = Paint()
      ..color = AppColors.roadYellow
      ..strokeWidth = 2;

    canvas.drawLine(
      Offset(size.width * 0.48, size.height * 0.3),
      Offset(size.width * 0.25, size.height),
      paintLine,
    );

    final paintWhiteLine = Paint()
      ..color = AppColors.white54
      ..strokeWidth = 2;

    canvas.drawLine(
      Offset(size.width * 0.52, size.height * 0.3),
      Offset(size.width * 0.75, size.height),
      paintWhiteLine,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
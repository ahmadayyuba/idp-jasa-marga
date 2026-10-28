import 'package:flutter/material.dart';

import '../data/cctv_mock_datasource.dart';
import '../data/models/camera_model.dart';
import '../data/models/segment_model.dart';
import 'widgets/cctv_live_header.dart';
import 'widgets/cctv_main_player_card.dart';
import 'widgets/cctv_camera_card.dart';

// Reusable Dashboard Widgets
import '../../features/dashboard/presentation/widgets/floating_side_button.dart';
import '../../features/dashboard/presentation/widgets/custom_bottom_nav_bar.dart';
import '../../core/constants/app_colors.dart';

class CctvLiveScreen extends StatefulWidget {
  final SegmentModel? segment;
  final String segmentName;

  const CctvLiveScreen({super.key, this.segment, this.segmentName = ''});

  String get effectiveSegmentName =>
      segment?.title ??
      (segmentName.isNotEmpty ? segmentName : 'Semua Segment');

  @override
  State<CctvLiveScreen> createState() => _CctvLiveScreenState();
}

class _CctvLiveScreenState extends State<CctvLiveScreen> {
  int _selectedCameraIndex = 0;

  final List<CameraModel> _cameras = CctvMockDatasource.cameraList;

  @override
  Widget build(BuildContext context) {
    final currentCamera = _cameras[_selectedCameraIndex];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.bgGradientStart, AppColors.bgGradientEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header Live View dengan Back Button
                        CctvLiveHeader(
                          segmentName: widget.effectiveSegmentName,
                          onBack: () => Navigator.of(context).pop(),
                        ),
                        const SizedBox(height: 16),

                        // Main Player Video Utama
                        CctvMainPlayerCard(
                          camera: currentCamera,
                          cameraTitle: currentCamera.code,
                          timestamp: currentCamera.timestamp,
                          directionText: currentCamera.direction,
                        ),
                        const SizedBox(height: 16),

                        // Lokasi Text Indicator
                        const Text(
                          'Lokasi',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_rounded,
                              color: AppColors.primaryBlue,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                currentCamera.location,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),

                  // Grid Kamera Bagian Bawah
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20)
                          .copyWith(bottom: 80),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 14,
                            childAspectRatio: 1.25,
                          ),
                      itemCount: _cameras.length,
                      itemBuilder: (context, index) {
                        final cam = _cameras[index];
                        final isSelected = index == _selectedCameraIndex;

                        return CctvCameraCard(
                          camera: cam,
                          title: cam.title,
                          subtitle: cam.subtitle,
                          isSelected: isSelected,
                          onTap: () {
                            setState(() {
                              _selectedCameraIndex = index;
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),

              // Floating Side Button
              Positioned(
                right: 0,
                bottom: MediaQuery.sizeOf(context).height * 0.05,
                child: FloatingSideButton(onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(activeIndex: 1),
    );
  }
}

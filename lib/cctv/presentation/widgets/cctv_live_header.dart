import 'package:flutter/material.dart';

import 'cctv_action_buttons.dart';
import '../../../core/constants/app_colors.dart';

class CctvLiveHeader extends StatelessWidget {
  final String segmentName;
  final VoidCallback onBack;

  const CctvLiveHeader({
    super.key,
    required this.segmentName,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onBack,
          borderRadius: BorderRadius.circular(20),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.primaryBlue,
              size: 20,
            ),
          ),
        ),
        const SizedBox(width: 8),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Segment',
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
              Text(
                segmentName,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),

        const CctvActionButtons(),
      ],
    );
  }
}

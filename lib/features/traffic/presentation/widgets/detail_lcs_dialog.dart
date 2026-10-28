import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class LcsGantryStatus {
  final String laneLabel; 
  final bool isOpen; 

  LcsGantryStatus({
    required this.laneLabel,
    required this.isOpen,
  });
}

class DetailLcsDialog extends StatelessWidget {
  final String title;
  final String ruasText;
  final String jalurText;
  final List<LcsGantryStatus> gantryList;

  const DetailLcsDialog({
    super.key,
    required this.title,
    required this.ruasText,
    required this.jalurText,
    required this.gantryList,
  });

  // Helper untuk menampilkan dialog secara modal
  static Future<void> show(
    BuildContext context, {
    required String title,
    required String ruasText,
    required String jalurText,
    required List<LcsGantryStatus> gantryList,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => DetailLcsDialog(
        title: title,
        ruasText: ruasText,
        jalurText: jalurText,
        gantryList: gantryList,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 0,
      backgroundColor: AppColors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header: Title + Close Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkNavy,
                      height: 1.3,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  borderRadius: BorderRadius.circular(20),
                  child: const Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      Icons.close_rounded,
                      size: 20,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(color: AppColors.dividerSlate, height: 1),
            const SizedBox(height: 12),

            // 2. Location Subtitle
            Text(
              'Ruas: $ruasText | Jalur: $jalurText',
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),

            // 3. Status Section Label
            const Text(
              'Status Display Tiap Lajur (Gantry Gantungan):',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 14),

            // 4. Gantry Sign Display Cards Row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: gantryList
                    .map((gantry) => Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: _buildGantryCard(gantry),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 24),

            // 5. Button Tutup
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryActive,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Tutup',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGantryCard(LcsGantryStatus gantry) {
    final bool isOpen = gantry.isOpen;
    final Color statusColor =
        isOpen ? AppColors.vibrantGreen : AppColors.alertRed;

    return Container(
      width: 90,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.textPrimary, // Dark Gantry Display Box
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.playerSurface),
      ),
      child: Column(
        children: [
          Text(
            gantry.laneLabel,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 10),
          Icon(
            isOpen ? Icons.arrow_downward_rounded : Icons.close_rounded,
            size: 24,
            color: statusColor,
          ),
          const SizedBox(height: 10),
          Text(
            isOpen ? 'OPEN' : 'CLOSED',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: statusColor,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
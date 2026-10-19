import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class KendaraanOperasionalScreen extends StatelessWidget {
  const KendaraanOperasionalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // --- 1. TIGA KARTU STATUS ARMADA ---
        Row(
          children: [
            Expanded(
              child: _buildStatusCard(
                title: 'Total Armada',
                value: '8',
                subtitle: 'Unit Terdaftar',
                valueColor: AppColors.primaryBlue,
                bgColor: AppColors.iconBoxBg,
                icon: Icons.directions_car,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildStatusCard(
                title: 'Online (Aktif)',
                value: '4',
                subtitle: 'Sedang Beroperasi',
                valueColor: AppColors.successGreen,
                bgColor: AppColors.bgSuccessSoft,
                icon: Icons.cell_tower, // Ikon sinyal memancar
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildStatusCard(
                title: 'Offline (Standby)',
                value: '4',
                subtitle: 'Di Pool / Parkir',
                valueColor: AppColors.dangerRed,
                bgColor: AppColors.bgDangerSoft,
                icon: Icons.signal_cellular_connected_no_internet_4_bar,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // --- 2. KARTU FILTER MANAGEMENT KENDARAAN ---
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.bgBorderSoft),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.my_location,
                    color: AppColors.primaryBlue,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Management Kendaraan Operasional',
                    style: AppTextStyles.cardHeader,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Filter Ruas & Status
              Row(
                children: [
                  Expanded(child: _buildDropdownField('Ruas', 'Semua Ruas')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildDropdownField('Status', 'Semua')),
                ],
              ),
              const SizedBox(height: 12),
              // Filter Vendor & Pencarian Nopol
              Row(
                children: [
                  Expanded(child: _buildDropdownField('Vendor', 'Semua')),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Pencarian', style: AppTextStyles.bodySmall),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.bgGraySoft,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.bgBorderSoft),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.search,
                                size: 16,
                                color: AppColors.textMuted,
                              ),
                              SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  'No. Polisi / Lambung...',
                                  style: TextStyle(
                                    color: AppColors.textMuted,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Baris Tombol Aksi (Terapkan, Reset, Export, Toggle View)
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Terapkan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.bgBorderSoft),
                    ),
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.primaryBlue),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.download_rounded,
                          size: 14,
                          color: AppColors.primaryBlue,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Export',
                          style: TextStyle(
                            color: AppColors.primaryBlue,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // Toggle Kartu | Tabel
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.bgGraySoft,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.bgBorderSoft),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlue,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: const Text(
                            'Kartu',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          child: Text(
                            'Tabel',
                            style: TextStyle(
                              color: AppColors.textMuted,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // --- 3. DAFTAR KARTU KENDARAAN ---
        _buildVehicleCard(
          context,
          plateNum: 'B 9473 KBB',
          type: 'MCS',
          lambung: 'No. Lambung: B 9473 KBB (ID: 3823)',
          ruas: 'Balikpapan-Samarinda',
          isOffline: true,
          odometer: '0 Km',
          updateTime: '2026-09-02 15:20',
          koordinat: '-1.18234, 116.89234',
        ),
        _buildVehicleCard(
          context,
          plateNum: 'B 9427 KBB',
          type: 'MCS',
          lambung: 'No. Lambung: B 9427 KBB (ID: 3822)',
          ruas: 'Jogja-Solo',
          isOffline: true,
          odometer: '0 Km',
          updateTime: '2026-09-02 15:15',
          koordinat: '-7.78211, 110.37123',
        ),

        // Spasi ekstra untuk mengamankan FAB (Floating Action Button) map dari menu navigasi
        const SizedBox(height: 80),
      ],
    );
  }

  // Helper untuk Kartu Ringkasan Atas
  Widget _buildStatusCard({
    required String title,
    required String value,
    required String subtitle,
    required Color valueColor,
    required Color bgColor,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: valueColor.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(icon, size: 16, color: valueColor),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(color: AppColors.textMuted, fontSize: 9.5),
          ),
        ],
      ),
    );
  }

  // Helper untuk Dropdown Filter
  Widget _buildDropdownField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.bodySmall),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.bgBorderSoft),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: AppTextStyles.itemTitle.copyWith(fontSize: 12),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 16,
                color: AppColors.textMuted,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Helper untuk Daftar Kendaraan
  Widget _buildVehicleCard(
    BuildContext context, {
    required String plateNum,
    required String type,
    required String lambung,
    required String ruas,
    required bool isOffline,
    required String odometer,
    required String updateTime,
    required String koordinat,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.bgBorderSoft),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Baris Atas: Ikon Truk, Plat, Tipe, & Status (On/Off)
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.iconBoxBg,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.local_shipping,
                  color: AppColors.primaryBlue,
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          plateNum,
                          style: AppTextStyles.cardHeader.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(type, style: AppTextStyles.bodySmall),
                      ],
                    ),
                    Text(lambung, style: AppTextStyles.bodySmall),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isOffline
                      ? AppColors.bgDangerSoft
                      : AppColors.bgSuccessSoft,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isOffline
                        ? AppColors.dangerRed.withValues(alpha: 0.3)
                        : AppColors.successGreen.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 8,
                      color: isOffline
                          ? AppColors.dangerRed
                          : AppColors.successGreen,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      isOffline ? 'Off' : 'On',
                      style: TextStyle(
                        color: isOffline
                            ? AppColors.dangerRed
                            : AppColors.successGreen,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, color: AppColors.bgBorderSoft),
          const SizedBox(height: 12),
          // Baris Tengah: Ruas Tol & Odometer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.swap_calls,
                    size: 16,
                    color: AppColors.textDark,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Ruas: $ruas',
                    style: AppTextStyles.itemTitle.copyWith(fontSize: 12),
                  ),
                ],
              ),
              Text('Odo: $odometer', style: AppTextStyles.bodySmall),
            ],
          ),
          const SizedBox(height: 16),
          // Baris Bawah: Waktu Update & Tombol Show in Map
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Update: $updateTime', style: AppTextStyles.bodySmall),
              GestureDetector(
                onTap: () {
                  // Munculkan Modal Pop-up Live GPS saat tombol ditekan
                  _showLiveGpsModal(
                    context,
                    plateNum,
                    ruas,
                    isOffline,
                    koordinat,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.iconBoxBg,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.map, size: 14, color: AppColors.primaryBlue),
                      SizedBox(width: 4),
                      Text(
                        'Show in Map',
                        style: TextStyle(
                          color: AppColors.primaryBlue,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- MODAL POP-UP LIVE GPS KENDARAAN ---
  void _showLiveGpsModal(
    BuildContext context,
    String plat,
    String ruas,
    bool isLost,
    String koordinat,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Modal
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColors.primaryBlue,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Live GPS: $plat',
                          style: AppTextStyles.cardHeader,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.close,
                        size: 20,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Area Dummy Map Gelap
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B233A),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Icon(
                          Icons.map,
                          color: Colors.white.withValues(alpha: 0.1),
                          size: 60,
                        ),
                      ),
                      // Indikator Posisi Kendaraan
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.dangerRed,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                '$plat (0 Km/j)',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.location_on,
                              color: AppColors.warningOrange,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                      // Badge GPS Signal LOST
                      if (isLost)
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.bgDangerSoft.withValues(
                                alpha: 0.2,
                              ),
                              border: Border.all(color: AppColors.dangerRed),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'GPS Signal: LOST',
                              style: TextStyle(
                                color: AppColors.dangerRed,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Grid Info Detail Modal (2x2)
                Row(
                  children: [
                    Expanded(
                      child: _buildModalInfoBox(Icons.route, 'Ruas Tol', ruas),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildModalInfoBox(
                        Icons.speed,
                        'Kecepatan',
                        '0 Km/j',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _buildModalInfoBox(
                        Icons.gps_fixed,
                        'Koordinat',
                        koordinat,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildModalInfoBox(
                        Icons.speed_outlined,
                        'Odometer',
                        '0 Km',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Tombol Tutup Peta
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Tutup Peta',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Helper Info Box di dalam Modal
  Widget _buildModalInfoBox(IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.bgBorderSoft),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: AppColors.textMuted),
              const SizedBox(width: 6),
              Text(
                title,
                style: AppTextStyles.bodySmall.copyWith(fontSize: 10),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(value, style: AppTextStyles.itemTitle.copyWith(fontSize: 11)),
        ],
      ),
    );
  }
}

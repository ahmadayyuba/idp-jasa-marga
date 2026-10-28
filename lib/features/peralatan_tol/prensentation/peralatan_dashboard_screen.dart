import 'package:flutter/material.dart';
import 'package:idp_jasa_marga/features/dashboard/presentation/widgets/custom_bottom_nav_bar.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import 'screens/realtime_ews_screen.dart';
import 'screens/realtime_radar_screen.dart';
import 'screens/realtime_speedcam_screen.dart';
import 'screens/cctv_ptz_screen.dart';
import 'screens/matrix_dms_screen.dart';
import 'screens/matrix_cctv_screen.dart';
import 'screens/management_cctv_screen.dart';
import 'screens/monitoring_alat_screen.dart';
import 'screens/monitoring_segment_hit_screen.dart';
import 'screens/pwo_rwgr_screen.dart';
import 'screens/realtime_cctv_off_screen.dart';
import 'screens/report_status_cctv_screen.dart';
import 'screens/realtime_dms_off_screen.dart';
import 'screens/summary_screen.dart';
import 'screens/kendaraan_operasional_screen.dart';

// Nanti kita import layar-layar spesifik di sini

class PeralatanDashboardScreen extends StatefulWidget {
  final int initialIndex;

  const PeralatanDashboardScreen({super.key, required this.initialIndex});

  @override
  State<PeralatanDashboardScreen> createState() =>
      _PeralatanDashboardScreenState();
}

class _PeralatanDashboardScreenState extends State<PeralatanDashboardScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    // 3. Tangkap nilai initialIndex saat widget pertama kali dimuat
    _selectedIndex = widget.initialIndex;
  }

  // Daftar nama 15 Menu Peralatan
  final List<String> _menuTabs = [
    'Summary',
    'PWO-RWGR',
    'Matrix CCTV',
    'Matrix DMS',
    'Management CCTV',
    'Report Status CCTV',
    'Kendaraan Operasional',
    'Monitoring Segment Hit Lalin',
    'Monitoring Alat',
    'Realtime CCTV (Off)',
    'CCTV PTZ',
    'Realtime DMS (Off)',
    'Realtime Speedcam',
    'Realtime EWS',
    'Realtime Radar',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Latar belakang gradien biru ke putih
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.bgGradientStart, AppColors.bgGradientEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              _buildTabPills(),
              // Bagian layar yang berubah-ubah (Screen Content)
              Expanded(child: _buildBodyContent()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }

  // --- KOMPONEN HEADER ---
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryBlue,
              size: 20,
            ),
            onPressed: () {
              // Logika kembali (kembali ke dashboard utama)
              Navigator.pop(context);
            },
          ),
          const Text('Peralatan Tol', style: AppTextStyles.screenTitle),
          const Spacer(),
          // Badge "15 Menu"
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              // --- PERBAIKAN: Menggunakan warna Biru Es pucat dari AppColors ---
              color: AppColors.iconBoxBg,
              borderRadius: BorderRadius.circular(20),
              // --- Hapus Border ---
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.grid_view_rounded,
                  color: AppColors.primaryBlue,
                  size: 14,
                ),
                const SizedBox(width: 4),
                Text(
                  '15 Menu',
                  style: AppTextStyles.badgeText.copyWith(
                    color: AppColors.primaryBlue,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Tombol Refresh
          Container(
            decoration: const BoxDecoration(
              color: Colors.white, // Tetap putih sesuai referensi
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.refresh,
                color: AppColors.primaryBlue,
                size: 20,
              ),
              onPressed: () {
                /* Logika Refresh */
              },
            ),
          ),
        ],
      ),
    );
  }

  // --- KOMPONEN TAB MENU ---
  Widget _buildTabPills() {
    return SizedBox(
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _menuTabs.length,
        itemBuilder: (context, index) {
          final isActive = _selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Container(
                // Kunci utamanya di sini: padding horizontal diperbesar
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isActive ? AppColors.primaryBlue : Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: isActive
                        ? AppColors.primaryBlue
                        : AppColors.bgBorderSoft,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  _menuTabs[index],
                  style: TextStyle(
                    color: isActive ? Colors.white : AppColors.textMuted,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // --- LOGIKA PERGANTIAN LAYAR (ROUTING INTERNAL) ---
  Widget _buildBodyContent() {
    String currentMenu = _menuTabs[_selectedIndex];

    // Ibarat switch-case di React Router
    switch (currentMenu) {
      case 'Summary':
        return const SummaryScreen();
      case 'Realtime EWS':
        return const RealtimeEwsScreen(); // <--- Panggil layar yang baru kita buat
      case 'Realtime Radar':
        return const RealtimeRadarScreen();
      case 'Realtime Speedcam':
        return const RealtimeSpeedcamScreen();
      case 'CCTV PTZ':
        return const CctvPtzScreen();
      case 'Matrix DMS':
        return const MatrixDmsScreen();
      case 'Matrix CCTV':
        return const MatrixCctvScreen();
      case 'Management CCTV':
        return const ManagementCctvScreen();
      case 'Monitoring Alat':
        return const MonitoringAlatScreen();
      case 'Monitoring Segment Hit Lalin':
        return const MonitoringSegmentHitScreen();
      case 'PWO-RWGR':
        return const PwoRwgrScreen();
      case 'Realtime CCTV (Off)':
        return const RealtimeCctvOffScreen();
      case 'Report Status CCTV':
        return const ReportStatusCctvScreen();
      case 'Realtime DMS (Off)':
        return const RealtimeDmsOffScreen();
      case 'Kendaraan Operasional':
        return const KendaraanOperasionalScreen();
      default:
        return Center(
          child: Text(
            'Halaman $currentMenu sedang dalam pengerjaan...',
            style: AppTextStyles.bodySmall,
          ),
        );
    }
  }
}

import 'package:flutter/material.dart';

import 'app_routes.dart';
import '../../features/auth/presentation/login_screen.dart';

// --- Import Screens Punya Kamu ---
import '../../features/traffic/traffic_dashboard_screen.dart';
import '../../features/traffic/presentation/realtime_traffic_screen.dart';
import '../../features/traffic/presentation/antrean_gerbang_screen.dart';
import '../../features/traffic/presentation/lalin_per_jam_screen.dart';
import '../../features/traffic/presentation/gangguan_lalin_screen.dart';
import '../../features/traffic/presentation/kinerja_lalin_screen.dart';
import '../../features/traffic/presentation/traffic_screen.dart';
import '../../features/traffic/presentation/management_lcs_screen.dart';
import '../../features/traffic/presentation/etle_wim_screen.dart';
import '../../features/maintenance/presentation/maintenance_parent_screen.dart';
import '../../features/maintenance/presentation/water_level_sensor_view.dart';

// --- Import Screens Punya Temen Kamu ---

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // 1. Login / Auth Screen
      case AppRoutes.loginscreen:
        return _buildRoute(const LoginScreen(), settings);

      // 2. Traffic Dashboard Main Screen
      case AppRoutes.trafficDashboard:
        return _buildRoute(const TrafficDashboardScreen(), settings);

      // 3. Realtime Traffic Speed Bars
      case AppRoutes.realtimeTraffic:
        return _buildRoute(const RealtimeTrafficScreen(), settings);

      // 4. Antrean Gerbang Tol
      case AppRoutes.antreanGerbang:
        return _buildRoute(const AntreanGerbangScreen(), settings);

      // 5. Lalin Per Jam & Traffic Counting
      case AppRoutes.lalinPerJam:
        return _buildRoute(const LalinPerJamScreen(), settings);

      // 6. Gangguan Lalin Status
      case AppRoutes.gangguanLalin:
        return _buildRoute(const GangguanLalinScreen(), settings);

      // 7. Kinerja Lalin & V/C Ratio
      case AppRoutes.kinerjaLalin:
        return _buildRoute(const KinerjaLalinScreen(), settings);

      // 8. Traffic Speed Bars Koridor Gelap
      case AppRoutes.trafficScreen:
        return _buildRoute(const TrafficScreen(), settings);

      // 9. Management LCS
      case AppRoutes.managementLcs:
        return _buildRoute(const ManagementLcsScreen(), settings);
      // 10. ETLE & WIM
      case AppRoutes.etleWimScreen:
        return _buildRoute(const EtleWimScreen(), settings);
      case AppRoutes.maintenanceSummary:
        return _buildRoute(const MaintenanceParentScreen(initialIndex: 0), settings);
      case AppRoutes.dataPemeliharaan:
        return _buildRoute(const MaintenanceParentScreen(initialIndex: 1), settings);
      case AppRoutes.waterLevelSensor:
        return _buildRoute(const MaintenanceParentScreen(initialIndex: 2), settings);
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Route tidak ditemukan: ${settings.name}'),
            ),
          ),
        );
    }
  }

  // Helper untuk membuat transisi instan (tanpa flicker/delay) antar-tab
  static PageRouteBuilder _buildRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }
}

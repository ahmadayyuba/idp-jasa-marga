import 'package:flutter/material.dart';

// Import asli milik temanmu
import 'features/dashboard/presentation/dashboard_screen.dart';
import 'core/routes/app_router.dart';
import 'core/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IDP Jasa Marga',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginscreen,
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData(
        fontFamily: 'Roboto',
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),
      // --- UBAH SEMENTARA UNTUK TESTING ---
      // Kita komen dulu layar utama milik temanmu:
      // home: const DashboardScreen(),

      // Kita panggil layar kerangka kita sebagai halaman pertama:
      home: const PeralatanDashboardScreen(),
    );
  }
}

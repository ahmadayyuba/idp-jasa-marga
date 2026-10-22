import 'package:flutter/material.dart';
import 'features/dashboard/presentation/dashboard_screen.dart';
import 'core/routes/app_router.dart';
import 'core/routes/app_routes.dart';
import 'core/constants/app_colors.dart';

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
        scaffoldBackgroundColor: AppColors.bgGradientEnd,
      ),
      // Menjadikan DashboardScreen sebagai tampilan utama
      home: const DashboardScreen(),
    );
  }
}

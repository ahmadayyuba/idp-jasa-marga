import 'package:flutter/material.dart';

import 'core/routes/app_router.dart';
import 'core/constants/app_colors.dart';
import 'core/session/auth_session_manager.dart';
import 'features/auth/presentation/login_screen.dart';
import 'features/dashboard/presentation/dashboard_screen.dart';

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
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData(
        fontFamily: 'Roboto',
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.bgGradientEnd,
      ),
      home: ValueListenableBuilder(
        valueListenable: AuthSessionManager.instance.currentUserNotifier,
        builder: (context, user, child) {
          if (user != null) {
            return const DashboardScreen();
          }
          return const LoginScreen();
        },
      ),
    );
  }
}

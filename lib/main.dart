import 'package:flutter/material.dart';
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
      theme: ThemeData(
        fontFamily: 'Roboto',
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),
      // Menjadikan DashboardScreen sebagai tampilan utama
      home: const DashboardScreen(),
    );
  }
}

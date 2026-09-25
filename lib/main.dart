import 'package:flutter/material.dart';

import 'core/widgets/custom_input_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing Component',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // Background biru gelap agar kartu putih CustomInputField terlihat jelas
        scaffoldBackgroundColor: const Color(0xFF001E3C),
      ),
      home: const TestInputFieldPage(),
    );
  }
}

// Page sementara khusus untuk melihat output CustomInputField
class TestInputFieldPage extends StatefulWidget {
  const TestInputFieldPage({super.key});

  @override
  State createState() => _TestInputFieldPageState();
}

class _TestInputFieldPageState extends State {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1. Preview Input Biasa (Employee ID)
              CustomInputField(
                controller: _idController,
                label: 'EMPLOYEE ID',
                hint: '10700',
                icon: Icons.badge_outlined,
              ),

              const SizedBox(height: 16),

              // 2. Preview Input Password (dengan toggle mata)
              CustomInputField(
                controller: _passController,
                label: 'PASSWORD / TOKEN',
                hint: '••••••••',
                icon: Icons.security_outlined,
                isPassword: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

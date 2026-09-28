import 'package:flutter/material.dart';

import 'widgets/background_layer.dart';
import 'widgets/footer_badge.dart';
import 'widgets/header_badges.dart';
import 'widgets/login_card.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberId = false;

  final TextEditingController _employeeIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _employeeIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignIn() {
    if (_formKey.currentState?.validate() ?? false) {
      final employeeId = _employeeIdController.text.trim();
      final password = _passwordController.text;
      debugPrint(
        'Proses Sign-In untuk Employee ID: $employeeId | Pass length: ${password.length}',
      );
    }
  }

  void _handleBiometric() {
    debugPrint('Integrasi Biometric Auth');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundLayer(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    const HeaderBadges(),
                    const SizedBox(height: 40),
                    LoginCard(
                      employeeIdController: _employeeIdController,
                      passwordController: _passwordController,
                      rememberId: rememberId,
                      onRememberIdChanged: (val) {
                        setState(() {
                          rememberId = val ?? false;
                        });
                      },
                      onSignIn: _handleSignIn,
                      onBiometricPressed: _handleBiometric,
                    ),
                    const SizedBox(height: 30),
                    const FooterBadge(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

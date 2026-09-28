import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_input_field.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../../../../core/widgets/square_icon_button.dart';
import 'card_header.dart';

class LoginCard extends StatelessWidget {
  final TextEditingController employeeIdController;
  final TextEditingController passwordController;
  final bool rememberId;
  final ValueChanged onRememberIdChanged;
  final VoidCallback onSignIn;
  final VoidCallback onBiometricPressed;

  const LoginCard({
    super.key,
    required this.employeeIdController,
    required this.passwordController,
    required this.rememberId,
    required this.onRememberIdChanged,
    required this.onSignIn,
    required this.onBiometricPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC).withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CardHeader(),
          const SizedBox(height: 28),

          const Text(
            'Sign-In',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Enter your operational credentials to proceed',
            style: TextStyle(fontSize: 13, color: AppColors.textMuted),
          ),

          const SizedBox(height: 24),

          CustomInputField(
            controller: employeeIdController,
            label: 'EMPLOYEE ID',
            hint: '10700',
            icon: Icons.badge_outlined,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Employee ID tidak boleh kosong';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          CustomInputField(
            controller: passwordController,
            label: 'PASSWORD/TOKEN',
            hint: '••••••••',
            icon: Icons.security_outlined,
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password tidak boleh kosong';
              }
              return null;
            },
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      value: rememberId,
                      activeColor: AppColors.primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      onChanged: onRememberIdChanged,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Remember ID',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textDark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: (){}, 
                child: const Text(
                  'Forgot Pin',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: GradientButton(
                  text: 'Sign in to JID',
                  icon: Icons.arrow_forward,
                onPressed: onSignIn),
                ),
                const SizedBox(width: 12),
                SquareIconButton(
                  icon: Icons.fingerprint, 
                  onPressed: onBiometricPressed
                  ),
            ],
          )
        ],
      ),
    );
  }
}

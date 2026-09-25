
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
 
class CustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final bool isPassword;
  final String? Function(String?)? validator;
 
  const CustomInputField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.validator,
  });
 
  // PENTING: generic <CustomInputField> di sini memberi tahu Dart bahwa
  // State yang dibuat ini pasangannya widget CustomInputField, bukan
  // StatefulWidget generik biasa.
  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}
 
// PENTING: generic <CustomInputField> di sini juga wajib ada. Karena inilah
// yang bikin `widget.icon`, `widget.label`, `widget.controller`, dst
// dikenali Dart — tanpa ini, `widget` cuma dianggap StatefulWidget biasa
// yang tidak punya properti custom apa pun.
class _CustomInputFieldState extends State<CustomInputField> {
  bool _isObscure = true;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.iconBoxBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(widget.icon, color: AppColors.primaryBlue, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.label,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 2),
                TextFormField(
                  controller: widget.controller,
                  obscureText: widget.isPassword ? _isObscure : false,
                  validator: widget.validator,
                  decoration: InputDecoration(
                    hintText: widget.hint,
                    hintStyle: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    errorStyle: const TextStyle(fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
          if (widget.isPassword)
            IconButton(
              icon: Icon(
                _isObscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.textMuted,
                size: 20,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
            ),
        ],
      ),
    );
  }
}
 

import 'package:flutter/material.dart';

class FloatingSideButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FloatingSideButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(left: 8, top: 6, bottom: 6, right: 8),
        decoration: const BoxDecoration(
          color: Color(0xFF333333), // Background kapsul abu-abu gelap
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            bottomLeft: Radius.circular(24),
          ),
        ),
        child: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Color(0xFF28A745), // Warna hijau tombol
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.more_horiz, color: Colors.white, size: 24),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CctvSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText; // 1. Properti hintText
  final Function(String)? onChanged;

  const CctvSearchBar({
    super.key,
    required this.controller,
    this.hintText = 'cari ruas', // 2. Default value jika tidak diisi
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(fontSize: 14, color: Color(0xFF0F172A)),
        decoration: InputDecoration(
          hintText: hintText, // 3. Dipakai di InputDecoration
          hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
          prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFF0F2B5B)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        ),
      ),
    );
  }
}
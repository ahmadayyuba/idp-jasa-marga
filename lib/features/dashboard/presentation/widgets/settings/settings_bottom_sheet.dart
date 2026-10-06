import 'package:flutter/material.dart';
import 'settings_profile_card.dart';
import 'settings_tile.dart';
import 'settings_logout_button.dart';
import '../../../../auth/presentation/login_screen.dart';
class SettingsBottomSheet extends StatefulWidget {
  const SettingsBottomSheet({super.key});

  /// Helper static method untuk memunculkan modal dari mana saja
  static Future show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const SettingsBottomSheet(),
    );
  }

  @override
  State createState() => _SettingsBottomSheetState();
}

class _SettingsBottomSheetState extends State {
  bool _isBiometricEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Color(0xFFF8FAFC),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          // Handle Bar Atas
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFCBD5E1),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Header Judul & Tombol Close
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Pengaturan & Keamanan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.close_rounded,
                  color: Color(0xFF64748B),
                  size: 22,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Sub-Komponen 1: Card Profil
          const SettingsProfileCard(
            name: 'Anggun Windari',
            role: 'Senior Traffic Controller',
            employeeId: '10700',
          ),
          const SizedBox(height: 24),

          // Judul Section
          const Text(
            'AUTENTIKASI & KEAMANAN',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
              color: Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 12),

          // Sub-Komponen 2: Tile Switch Biometrik
          SettingsTile(
            icon: Icons.fingerprint_rounded,
            title: 'Kunci Biometrik (Fingerprint)',
            subtitle: 'Gunakan sidik jari/Face ID HP untuk login cepat',
            trailing: Switch.adaptive(
              value: _isBiometricEnabled,
              activeColor: const Color(0xFF003399),
              activeTrackColor: const Color(0xFF93C5FD),
              onChanged: (val) {
                setState(() {
                  _isBiometricEnabled = val;
                });
              },
            ),
          ),
          const SizedBox(height: 24),

          // Sub-Komponen 3: Tombol Logout
// Sub-Komponen 3: Tombol Logout
SettingsLogoutButton(
  onPressed: () {
    // 1. Tutup Bottom Sheet dulu
    Navigator.of(context).pop();

    // 2. Arahkan pengguna kembali ke LoginScreen & hapus tumpukan navigasi sebelumnya
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
      (route) => false, // false artinya user tidak bisa tekan back untuk kembali ke Dashboard
    );
  },
),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
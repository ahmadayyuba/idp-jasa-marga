import 'package:flutter/material.dart';
import 'notification_header.dart';
import 'notification_filter_pills.dart';
import 'notification_card.dart';

class NotificationBottomSheet extends StatefulWidget {
  const NotificationBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const NotificationBottomSheet(),
    );
  }

  @override
  State<NotificationBottomSheet> createState() =>
      _NotificationBottomSheetState();
}

class _NotificationBottomSheetState extends State<NotificationBottomSheet> {
  int _selectedFilterIndex = 0;

  final List<Map<String, dynamic>> _filters = [
    {'label': 'Semua', 'count': 4},
    {'label': 'Lalu Lintas', 'count': 1},
    {'label': 'Gerbang Tol', 'count': 1},
    {'label': 'Pemeliharaan', 'count': 1},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.88,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Column(
        children: [
          // Sub-Komponen 1: Header
          NotificationHeader(
            newCount: 3,
            onReadAll: () {},
            onClose: () => Navigator.of(context).pop(),
          ),
          const SizedBox(height: 16),

          // Sub-Komponen 2: Filter Pills
          NotificationFilterPills(
            selectedIndex: _selectedFilterIndex,
            filters: _filters,
            onSelected: (index) => setState(() => _selectedFilterIndex = index),
          ),
          const SizedBox(height: 16),

          // Sub-Komponen 3: List Notification Cards
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                NotificationCard(
                  statusType: 'KRITIS',
                  statusColor: const Color(0xFFDC2626),
                  statusBgColor: const Color(0xFFFEE2E2),
                  borderColor: const Color(0xFFFECACA),
                  dotColor: const Color(0xFFEF4444),
                  icon: Icons.minor_crash_rounded,
                  location: 'Ruas Tol Japek KM 14+200 A',
                  time: '2 menit lalu',
                  title: 'Kecelakaan Beruntun KM 14+200',
                  description:
                      'Lajur 2 & 3 tertutup di Tol Jakarta - Cikampek Arah Cikampek. Petugas derek & PJR sudah di lokasi.',
                  actionText: 'Pantau CCTV Ruas',
                  onActionTap: () {},
                ),
                NotificationCard(
                  statusType: 'PERINGATAN',
                  statusColor: const Color(0xFFEA580C),
                  statusBgColor: const Color(0xFFFFEDD5),
                  borderColor: const Color(0xFFFED7AA),
                  dotColor: const Color(0xFFF97316),
                  icon: Icons.tag_rounded,
                  location: 'GT Cikunir 2 - JORR',
                  time: '15 menit lalu',
                  title: 'Antrian Padat Gerbang Cikunir 2',
                  description:
                      'Panjang antrian mencapai 1.4 KM akibat lonjakan volume kendaraan jam pulang kantor.',
                  actionText: 'Buka Dashboard Gerbang',
                  onActionTap: () {},
                ),
                NotificationCard(
                  statusType: 'INFO',
                  statusColor: const Color(0xFF0284C7),
                  statusBgColor: const Color(0xFFE0F2FE),
                  borderColor: const Color(0xFFBAE6FD),
                  dotColor: const Color(0xFF0EA5E9),
                  icon: Icons.build_rounded,
                  location: 'Tol Jagorawi KM 28+400',
                  time: '45 menit lalu',
                  title: 'Pemeliharaan Rutin Saluran Air',
                  description:
                      'Pekerjaan scraping & filling lubang KM 28+400 Ruas Jagorawi. Lajur 1 diberlakukan perambuan hati-hati.',
                  actionText: 'Lihat SPK Pemeliharaan',
                  onActionTap: () {},
                ),
                NotificationCard(
                  statusType: 'NORMAL',
                  statusColor: const Color(0xFF16A34A),
                  statusBgColor: const Color(0xFFDCFCE7),
                  borderColor: const Color(0xFFBBF7D0),
                  dotColor: const Color(0xFF22C55E),
                  icon: Icons.videocam_rounded,
                  location: 'JID Server Command Center',
                  time: '2 jam lalu',
                  title: 'Sinkronisasi Sensor CCTV Normal',
                  description:
                      'Seluruh node transmisi sensor CCTV wilayah JABODETABEK terhubung kembali secara terpusat.',
                  actionText: 'Cek Status Server',
                  onActionTap: () {},
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
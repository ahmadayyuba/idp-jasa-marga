import 'package:flutter/material.dart';

class GangguanLalinFilterCard extends StatefulWidget {
  final int incidentCount;
  final VoidCallback? onApply;
  final VoidCallback? onReset;

  const GangguanLalinFilterCard({
    super.key,
    this.incidentCount = 5,
    this.onApply,
    this.onReset,
  });

  @override
  State<GangguanLalinFilterCard> createState() =>
      _GangguanLalinFilterCardState();
}

class _GangguanLalinFilterCardState extends State<GangguanLalinFilterCard> {
  String _selectedRuas = 'Semua Ruas';
  String _selectedJalur = 'Semua';
  String _selectedJenis = 'Semua';
  String _selectedStatus = 'Semua';
  int _viewMode = 0; // 0 = Kartu, 1 = Tabel

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Filter: Title + Insiden Count
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    size: 18,
                    color: Color(0xFFDC2626),
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Gangguan Lalu Lintas',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F2B5B),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE4E6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${widget.incidentCount} Insiden',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFDC2626),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Row Dropdown 1: Filter Ruas & Filter Jalur
          Row(
            children: [
              Expanded(
                child: _buildDropdown(
                  label: 'Filter Ruas',
                  value: _selectedRuas,
                  items: ['Semua Ruas', 'Cipularang', 'Jagorawi'],
                  onChanged: (val) => setState(() => _selectedRuas = val!),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildDropdown(
                  label: 'Filter Jalur',
                  value: _selectedJalur,
                  items: ['Semua', 'Arah A', 'Arah B'],
                  onChanged: (val) => setState(() => _selectedJalur = val!),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Row Dropdown 2: Filter Jenis & Filter Status
          Row(
            children: [
              Expanded(
                child: _buildDropdown(
                  label: 'Filter Jenis',
                  value: _selectedJenis,
                  items: ['Semua', 'Kendaraan Gangguan', 'Ban Pecah'],
                  onChanged: (val) => setState(() => _selectedJenis = val!),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildDropdown(
                  label: 'Filter Status',
                  value: _selectedStatus,
                  items: ['Semua', 'Dalam Penanganan', 'Belum Ditangani'],
                  onChanged: (val) => setState(() => _selectedStatus = val!),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Row Action Buttons & Segmented View Toggle
          Row(
            children: [
              // Button Terapkan
              ElevatedButton(
                onPressed: widget.onApply,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Terapkan',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 8),

              // Button Reset
              OutlinedButton(
                onPressed: widget.onReset,
                style: OutlinedButton.styleFrom(
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  side: const BorderSide(color: Color(0xFFCBD5E1)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Reset',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF64748B),
                  ),
                ),
              ),
              const Spacer(),

              // Segmented Toggle: Kartu vs Tabel
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    _buildViewTab('Kartu', 0),
                    _buildViewTab('Tabel', 1),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Color(0xFF64748B),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE2E8F0)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 18,
                color: Color(0xFF64748B),
              ),
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
              onChanged: onChanged,
              items: items.map((e) {
                return DropdownMenuItem<String>(value: e, child: Text(e));
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildViewTab(String label, int index) {
    final isSelected = _viewMode == index;
    return GestureDetector(
      onTap: () => setState(() => _viewMode = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF003399) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : const Color(0xFF64748B),
          ),
        ),
      ),
    );
  }
}

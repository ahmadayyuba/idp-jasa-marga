import 'package:flutter/material.dart';

class EtleFilterCard extends StatefulWidget {
  const EtleFilterCard({super.key});

  @override
  State<EtleFilterCard> createState() => _EtleFilterCardState();
}

class _EtleFilterCardState extends State<EtleFilterCard> {
  int _viewMode = 1; // 0 = Harian, 1 = Bulanan
  String _selectedYear = '2026';
  String _selectedStartMonth = 'Januari';
  String _selectedEndMonth = 'September';

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
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Row 1: Title + Maintenance Badge + Toggle Harian/Bulanan
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'ETLE & WIM',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F2B5B),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEDD5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Under Maintenance',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEA580C),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    _buildToggle('Harian', 0),
                    _buildToggle('Bulanan', 1),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Row 2: Dropdowns
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildDropdown(
                  value: _selectedYear,
                  items: ['2025', '2026'],
                  onChanged: (val) => setState(() => _selectedYear = val!),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 3,
                child: _buildDropdown(
                  value: _selectedStartMonth,
                  items: ['Januari', 'Februari', 'Maret'],
                  onChanged: (val) =>
                      setState(() => _selectedStartMonth = val!),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'S/D',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF64748B),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: _buildDropdown(
                  value: _selectedEndMonth,
                  items: ['Agustus', 'September', 'Oktober'],
                  onChanged: (val) => setState(() => _selectedEndMonth = val!),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToggle(String label, int index) {
    final isSelected = _viewMode == index;
    return GestureDetector(
      onTap: () => setState(() => _viewMode = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFDBEAFE)
              : Colors.transparent, // Light Blue for active
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: isSelected
                ? const Color(0xFF1E3A8A)
                : const Color(0xFF64748B),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
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
            size: 16,
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
    );
  }
}

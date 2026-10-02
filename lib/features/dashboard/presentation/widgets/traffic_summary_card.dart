import 'package:flutter/material.dart';

import 'traffic_detail_dialog.dart';

class TrafficSummaryCard extends StatefulWidget {
  const TrafficSummaryCard({super.key});

  @override
  State createState() => _TrafficSummaryCardState();
}

class _TrafficSummaryCardState extends State {
  int _selectedTabIndex = 0;

  final List _tabs = [
    'Gangguan\nLalu Lintas',
    'Rekayasa\nLalu Lintas',
    'Pemeliharaan\nJalan Tol',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          // Tab Header
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFF005BAC),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: List.generate(_tabs.length, (index) {
                final isSelected = _selectedTabIndex == index;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedTabIndex = index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        _tabs[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? const Color(0xFF003399)
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 12),

          // Content Table
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              children: [
                // Table Header
                const Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Ruas',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF003399),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'KM',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF003399),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Arah',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF003399),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Dampak',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF003399),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(height: 16),

                // Row Items
                _buildTableRow(
                  'Jakarta - Cik...',
                  '50+800',
                  'Cikampek',
                  'Kepadatan +1KM',
                  true,
                ),
                _buildTableRow(
                  'Cipularang',
                  '093+100',
                  'Bandung',
                  'Lancar',
                  false,
                ),
                _buildTableRow(
                  'Jagorawi',
                  '014+200',
                  'Ciawi',
                  'Lancar Terkendali',
                  false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow(
    String ruas,
    String km,
    String arah,
    String dampak,
    bool isWarning,
  ) {
    return InkWell(
      // BUKA DIALOG SAAT BARIS DIKLIK
      onTap: () {
        TrafficDetailDialog.show(context);
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 14,
                    color: isWarning ? Colors.blue : Colors.blue.shade300,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      ruas,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                km,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                arah,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                dampak,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: isWarning ? Colors.black : Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

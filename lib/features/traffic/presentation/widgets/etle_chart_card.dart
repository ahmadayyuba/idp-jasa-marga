import 'package:flutter/material.dart';

class EtleChartCard extends StatelessWidget {
  const EtleChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy Data
    final List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
    ];
    final List<double> barHeights = [
      0.6,
      0.65,
      0.6,
      0.65,
      0.65,
      0.65,
      0.68,
      0.6,
    ];
    final List<double> lineHeights = [
      0.65,
      0.15,
      0.85,
      0.45,
      0.55,
      0.3,
      0.1,
      0.3,
    ];

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Grafik Kondisi ETLE & WIM Bulanan',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F2B5B),
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Korelasi Kecepatan Rata-Rata & Jumlah Pelanggaran',
                      style: TextStyle(fontSize: 10, color: Color(0xFF64748B)),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  '2026',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F2B5B),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Chart Area Container
          Container(
            height: 220,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A), // Dark Background
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                // Y-Axis Labels
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _YAxisLine(labelL: '200', labelR: '20'),
                    _YAxisLine(labelL: '150', labelR: '15'),
                    _YAxisLine(labelL: '100', labelR: '10'),
                    _YAxisLine(labelL: '50', labelR: '5'),
                    _YAxisLine(labelL: '0', labelR: '0'),
                  ],
                ),

                // Bars & Line Overlay
                Positioned.fill(
                  top: 10,
                  bottom: 20, // leave space for X-axis labels
                  left: 24,
                  right: 24,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Stack(
                        children: [
                          // Bars
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: barHeights.map((pct) {
                              return Container(
                                width: 20,
                                height: constraints.maxHeight * pct,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF10B981), // Green Bars
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(4),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          // Custom Paint for the Line
                          CustomPaint(
                            size: Size(
                              constraints.maxWidth,
                              constraints.maxHeight,
                            ),
                            painter: _LineChartPainter(
                              points: lineHeights,
                              lineColor: const Color(0xFF38BDF8), // Light Blue
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                // X-Axis Labels
                Positioned(
                  bottom: 0,
                  left: 24,
                  right: 24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: months.map((m) {
                      return SizedBox(
                        width: 20,
                        child: Text(
                          m,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 9,
                            color: Colors.white54,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Legends
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildLegend(
                const Color(0xFF10B981),
                'Kecepatan Rata-Rata (Km/j)',
              ),
              _buildLegend(
                const Color(0xFF38BDF8),
                'Jumlah Pelanggaran (Kasus)',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegend(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Color(0xFF475569),
          ),
        ),
      ],
    );
  }
}

class _YAxisLine extends StatelessWidget {
  final String labelL;
  final String labelR;
  const _YAxisLine({required this.labelL, required this.labelR});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          child: Text(
            labelL,
            style: const TextStyle(fontSize: 8, color: Colors.white38),
          ),
        ),
        const Expanded(
          child: Divider(color: Colors.white10, height: 1, thickness: 1),
        ),
        SizedBox(
          width: 20,
          child: Text(
            labelR,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 8, color: Colors.white38),
          ),
        ),
      ],
    );
  }
}

class _LineChartPainter extends CustomPainter {
  final List<double> points;
  final Color lineColor;

  _LineChartPainter({required this.points, required this.lineColor});

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) return;

    final paintLine = Paint()
      ..color = lineColor
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;

    final paintDotOuter = Paint()..color = Colors.white;
    final paintDotInner = Paint()..color = lineColor;

    final double stepX = size.width / (points.length - 1);
    final Path path = Path();

    // Mapping titik ke koordinat canvas (0,0 ada di kiri atas)
    List<Offset> offsets = [];
    for (int i = 0; i < points.length; i++) {
      double x = i * stepX;
      double y = size.height - (points[i] * size.height);
      offsets.add(Offset(x, y));

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paintLine);

    for (var offset in offsets) {
      canvas.drawCircle(offset, 4.0, paintDotOuter); // Border putih dot
      canvas.drawCircle(offset, 2.5, paintDotInner); // Inner dot biru
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

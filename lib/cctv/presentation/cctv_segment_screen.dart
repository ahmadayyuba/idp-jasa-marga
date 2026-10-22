import 'package:flutter/material.dart';

import 'widgets/cctv_segment_header.dart';
import 'widgets/cctv_search_bar.dart';
import 'widgets/cctv_segment_card.dart';

// Reusable Dashboard Widgets
import '../../features/dashboard/presentation/widgets/floating_side_button.dart';
import '../../features/dashboard/presentation/widgets/custom_bottom_nav_bar.dart';

class CctvSegmentScreen extends StatefulWidget {
  final String ruasName;

  const CctvSegmentScreen({
    super.key,
    required this.ruasName,
  });

  @override
  State<CctvSegmentScreen> createState() => _CctvSegmentScreenState();
}

class _CctvSegmentScreenState extends State<CctvSegmentScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<String> _allSegments = [
    'Semua Segment',
    'SS CAWANG - TEBET',
    'SS CAWANG - CILILITAN',
    'SS TMII - CIBUBUR',
    'SS GUNUNG PUTRI - BOGOR',
    'SS BOGOR - CIAWI',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<String> get _filteredSegments {
    if (_searchQuery.isEmpty) return _allSegments;
    return _allSegments.where((segment) {
      if (segment == 'Semua Segment') return true;
      return segment.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredSegments;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0F2FE), Color(0xFFF8FAFC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  children: [ 
                    CctvSegmentHeader(
                      ruasName: widget.ruasName,
                      onBack: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(height: 20),

                    CctvSearchBar(
                      controller: _searchController,
                      hintText: 'cari segment',
                      onChanged: (query) {
                        setState(() {
                          _searchQuery = query;
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    // Grid View untuk Daftar Segment
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.only(bottom: 80),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.0,
                        ),
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          final segment = filtered[index];
                          final isAll = segment == 'Semua Segment';

                          return CctvSegmentCard(
                            title: segment,
                            isAll: isAll,
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Menuju Live CCTV: $segment'),
                                ),
                              );
                              // TODO: Tahap berikutnya akan membuka CctvLiveScreen / Live View
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Floating Side Button
              Positioned(
                right: 0,
                bottom: MediaQuery.sizeOf(context).height * 0.05,
                child: FloatingSideButton(onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
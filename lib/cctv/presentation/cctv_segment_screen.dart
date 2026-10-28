import 'package:flutter/material.dart';

import '../data/cctv_mock_datasource.dart';
import '../data/models/ruas_model.dart';
import '../data/models/segment_model.dart';
import 'widgets/cctv_segment_header.dart';
import 'widgets/cctv_search_bar.dart';
import 'widgets/cctv_segment_card.dart';
import 'cctv_live_screen.dart';

// Reusable Dashboard Widgets

import '../../features/dashboard/presentation/widgets/custom_bottom_nav_bar.dart';
import '../../core/constants/app_colors.dart';

class CctvSegmentScreen extends StatefulWidget {
  final RuasModel? ruas;
  final String ruasName;

  const CctvSegmentScreen({super.key, this.ruas, this.ruasName = 'JAGORAWI'});

  String get effectiveRuasName => ruas?.title ?? ruasName;

  @override
  State<CctvSegmentScreen> createState() => _CctvSegmentScreenState();
}

class _CctvSegmentScreenState extends State<CctvSegmentScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<SegmentModel> get _filteredSegments {
    final segments = CctvMockDatasource.segmentList;
    if (_searchQuery.isEmpty) return segments;
    final query = _searchQuery.toLowerCase();
    return segments.where((segment) {
      if (segment.isAll) return true;
      return segment.title.toLowerCase().contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredSegments;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.bgGradientStart, AppColors.bgGradientEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    CctvSegmentHeader(
                      ruasName: widget.effectiveRuasName,
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
                        itemCount: filtered.length,
                        padding: const EdgeInsets.only(bottom: 80),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 1.0,
                            ),
                        itemBuilder: (context, index) {
                          final segment = filtered[index];

                          return CctvSegmentCard(
                            segment: segment,
                            title: segment.title,
                            isAll: segment.isAll,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CctvLiveScreen(
                                    segment: segment,
                                    segmentName: segment.title,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

             
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(activeIndex: 1),
    );
  }
}

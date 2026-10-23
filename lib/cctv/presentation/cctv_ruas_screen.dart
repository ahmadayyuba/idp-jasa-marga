import 'package:flutter/material.dart';

import '../data/cctv_mock_datasource.dart';
import '../data/models/ruas_model.dart';
import 'widgets/cctv_header.dart';
import 'widgets/cctv_search_bar.dart';
import 'widgets/cctv_ruas_card.dart';
import './cctv_segment_screen.dart';

// Reusable Dashboard Widgets
import '../../features/dashboard/presentation/widgets/floating_side_button.dart';
import '../../features/dashboard/presentation/widgets/custom_bottom_nav_bar.dart';
import '../../core/constants/app_colors.dart';

class CctvRuasScreen extends StatefulWidget {
  const CctvRuasScreen({super.key});

  @override
  State<CctvRuasScreen> createState() => _CctvRuasScreenState();
}

class _CctvRuasScreenState extends State<CctvRuasScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<RuasModel> get _filteredRuas {
    final list = CctvMockDatasource.ruasList;
    if (_searchQuery.isEmpty) return list;
    final query = _searchQuery.toLowerCase();
    return list.where((ruas) {
      return ruas.title.toLowerCase().contains(query) ||
          ruas.subtitle.toLowerCase().contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredRuas;

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
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    const CctvHeader(),
                    const SizedBox(height: 20),

                    CctvSearchBar(
                      controller: _searchController,
                      hintText: 'cari ruas',
                      onChanged: (query) {
                        setState(() {
                          _searchQuery = query;
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    // List Render
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filtered.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final ruas = filtered[index];
                        return CctvRuasCard(
                          ruas: ruas,
                          title: ruas.title,
                          subtitle: ruas.subtitle,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CctvSegmentScreen(
                                  ruas: ruas,
                                  ruasName: ruas.title,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                bottom: MediaQuery.of(context).size.height * 0.015,
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

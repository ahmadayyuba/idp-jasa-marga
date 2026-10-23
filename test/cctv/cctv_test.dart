import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idp_jasa_marga/cctv/data/cctv_mock_datasource.dart';
import 'package:idp_jasa_marga/cctv/presentation/cctv_ruas_screen.dart';
import 'package:idp_jasa_marga/cctv/presentation/cctv_segment_screen.dart';
import 'package:idp_jasa_marga/cctv/presentation/cctv_live_screen.dart';
import 'package:idp_jasa_marga/cctv/presentation/widgets/cctv_ruas_card.dart';
import 'package:idp_jasa_marga/cctv/presentation/widgets/cctv_segment_card.dart';
import 'package:idp_jasa_marga/cctv/presentation/widgets/cctv_camera_card.dart';
import 'package:idp_jasa_marga/cctv/presentation/widgets/cctv_main_player_card.dart';

void main() {
  group('CCTV Mock Datasource and Model Tests', () {
    test('Mock Datasource has valid data', () {
      expect(CctvMockDatasource.ruasList.isNotEmpty, isTrue);
      expect(CctvMockDatasource.segmentList.isNotEmpty, isTrue);
      expect(CctvMockDatasource.cameraList.isNotEmpty, isTrue);

      final firstRuas = CctvMockDatasource.ruasList.first;
      expect(firstRuas.title, 'JAGORAWI');
      expect(firstRuas.subtitle, 'JAKARTA - BOGOR - CIAWI');

      final firstSegment = CctvMockDatasource.segmentList.first;
      expect(firstSegment.title, 'Semua Segment');
      expect(firstSegment.isAll, isTrue);

      final firstCamera = CctvMockDatasource.cameraList.first;
      expect(firstCamera.code, '01+600 Cililitan');
      expect(firstCamera.location, contains('KM 00+400'));
    });
  });

  group('CCTV Screens Widget Tests', () {
    testWidgets('CctvRuasScreen renders ruas cards and filters correctly', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        const MaterialApp(
          home: CctvRuasScreen(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(CctvRuasCard), findsNWidgets(CctvMockDatasource.ruasList.length));
      expect(find.text('JAGORAWI'), findsOneWidget);

      // Test search filter with 'cikampek'
      await tester.enterText(find.byType(TextField), 'cikampek');
      await tester.pumpAndSettle();

      expect(find.byType(CctvRuasCard), findsOneWidget);
      expect(find.text('JAKARTA - CIKAMPEK'), findsOneWidget);
    });

    testWidgets('CctvSegmentScreen renders segment cards and filters correctly', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      final selectedRuas = CctvMockDatasource.ruasList.first;

      await tester.pumpWidget(
        MaterialApp(
          home: CctvSegmentScreen(ruas: selectedRuas),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(CctvSegmentCard), findsNWidgets(CctvMockDatasource.segmentList.length));
      expect(find.text('Semua Segment'), findsOneWidget);
      expect(find.text('SS CAWANG - TEBET'), findsOneWidget);

      // Test search filter
      await tester.enterText(find.byType(TextField), 'tmii');
      await tester.pumpAndSettle();

      // "Semua Segment" is always shown, plus matching "SS TMII - CIBUBUR"
      expect(find.byType(CctvSegmentCard), findsNWidgets(2));
      expect(find.text('SS TMII - CIBUBUR'), findsOneWidget);
    });

    testWidgets('CctvLiveScreen renders player card and camera grid correctly', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      final selectedSegment = CctvMockDatasource.segmentList[1];

      await tester.pumpWidget(
        MaterialApp(
          home: CctvLiveScreen(segment: selectedSegment),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(CctvMainPlayerCard), findsOneWidget);
      expect(find.byType(CctvCameraCard), findsNWidgets(CctvMockDatasource.cameraList.length));
      expect(find.text(selectedSegment.title), findsOneWidget);
      expect(find.text('01+600 Cililitan [LIVE] 2026-08-27 06:30:15'), findsOneWidget);
      expect(find.text('KM 00+400 | CAWANG - CILILITAN'), findsOneWidget);
    });
  });
}

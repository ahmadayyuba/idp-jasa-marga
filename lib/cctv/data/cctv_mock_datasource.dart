import '../data/models/camera_model.dart';
import '../data/models/ruas_model.dart';
import '../data/models/segment_model.dart';

class CctvMockDatasource {
    static const List<RuasModel> ruasList = [
    RuasModel(
        id: 'ruas_jagorawi',
        title: 'JAGORAWI',
        subtitle: 'JAKARTA - BOGOR - CIAWI',
    ),
    RuasModel(
        id: 'ruas_dalam_kota',
        title: 'DALAM KOTA',
        subtitle: 'CAWANG - TOMANG - PLUIT',
    ),
    RuasModel(
        id: 'ruas_sedyatmo',
        title: 'SEDYATMO',
        subtitle: 'PROF. DR. IR. SOEDIJATMO',
    ),
    RuasModel(
        id: 'ruas_japek',
        title: 'JAKARTA - CIKAMPEK',
        subtitle: 'JAKARTA - CIKAMPEK ELEVATED',
    ),
    RuasModel(
        id: 'ruas_jorr',
        title: 'TOL LINGKAR LUAR JAKARTA',
        subtitle: 'JORR NON S & JORR S',
    ),
];

    static const List<SegmentModel> segmentList = [
    SegmentModel(
        id: 'seg_all',
        ruasId: 'ruas_jagorawi',
        title: 'Semua Segment',
        isAll: true,
    ),
    SegmentModel(
        id: 'seg_1',
        ruasId: 'ruas_jagorawi',
        title: 'SS CAWANG - TEBET',
    ),
    SegmentModel(
        id: 'seg_2',
        ruasId: 'ruas_jagorawi',
        title: 'SS CAWANG - CILILITAN',
    ),
    SegmentModel(
        id: 'seg_3',
        ruasId: 'ruas_jagorawi',
        title: 'SS TMII - CIBUBUR',
    ),
    SegmentModel(
        id: 'seg_4',
        ruasId: 'ruas_jagorawi',
        title: 'SS GUNUNG PUTRI - BOGOR',
    ),
    SegmentModel(
        id: 'seg_5',
        ruasId: 'ruas_jagorawi',
        title: 'SS BOGOR - CIAWI',
    ),
];

    static const List<CameraModel> cameraList = [
    CameraModel(
        id: 'cam_1',
        segmentId: 'seg_2',
        code: '01+600 Cililitan',
        title: 'SS KM 00+400',
        subtitle: 'CAWANG - CILILITAN',
        location: 'KM 00+400 | CAWANG - CILILITAN',
        direction: 'CAWANG',
        timestamp: '2026-08-27 06:30:15',
    ),
    CameraModel(
        id: 'cam_2',
        segmentId: 'seg_2',
        code: '01+600 Cililitan',
        title: 'SS CKM 00+400',
        subtitle: 'GERBANG TOL CILILITAN',
        location: 'KM 00+400 | GERBANG TOL CILILITAN',
        direction: 'CILILITAN',
        timestamp: '2026-08-27 06:30:15',
    ),
    CameraModel(
        id: 'cam_3',
        segmentId: 'seg_1',
        code: '03+200 Tebet',
        title: 'SS KM 03+200',
        subtitle: 'SIMPANG SUSUN TEBET',
        location: 'KM 03+200 | SIMPANG SUSUN TEBET',
        direction: 'TEBET',
        timestamp: '2026-08-27 06:30:15',
    ),
    CameraModel(
        id: 'cam_4',
        segmentId: 'seg_3',
        code: '08+100 TMII',
        title: 'SS KM 08+100',
        subtitle: 'GERBANG TOL TMII',
        location: 'KM 08+100 | GERBANG TOL TMII',
        direction: 'TMII',
        timestamp: '2026-08-27 06:30:15',
    ),
];
}

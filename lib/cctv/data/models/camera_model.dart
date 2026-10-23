class CameraModel {
  final String id;
  final String segmentId;
  final String code;
  final String title;
  final String subtitle;
  final String location;
  final String direction;
  final bool isLive;
  final String timestamp;

  const CameraModel({
    required this.id,
    required this.segmentId,
    required this.code,
    required this.title,
    required this.subtitle,
    required this.location,
    required this.direction,
    this.isLive = true,
    required this.timestamp,
  });

  factory CameraModel.fromJson(Map<String, dynamic> json) {
    return CameraModel(
      id: json['id'] as String? ?? '',
      segmentId: json['segment_id'] as String? ?? '',
      code: json['code'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      location: json['location'] as String? ?? '',
      direction: json['direction'] as String? ?? '',
      isLive: json['is_live'] as bool? ?? true,
      timestamp: json['timestamp'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'segment_id': segmentId,
      'code': code,
      'title': title,
      'subtitle': subtitle,
      'location': location,
      'direction': direction,
      'is_live': isLive,
      'timestamp': timestamp,
    };
  }
}
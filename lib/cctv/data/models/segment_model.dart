class SegmentModel {
  final String id;
  final String ruasId;
  final String title;
  final bool isAll;

  const SegmentModel({
    required this.id,
    required this.ruasId,
    required this.title,
    this.isAll = false,
  });

  factory SegmentModel.fromJson(Map<String, dynamic> json) {
    return SegmentModel(
      id: json['id'] as String? ?? '',
      ruasId: json['ruas_id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      isAll: json['is_all'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ruas_id': ruasId,
      'title': title,
      'is_all': isAll,
    };
  }
}
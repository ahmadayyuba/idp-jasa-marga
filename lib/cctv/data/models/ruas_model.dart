class RuasModel {
  final String id;
  final String title;
  final String subtitle;

  const RuasModel({
    required this.id,
    required this.title,
    required this.subtitle,
  });

  factory RuasModel.fromJson(Map<String, dynamic> json) {
    return RuasModel(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
    };
  }
}
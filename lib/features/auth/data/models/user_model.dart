class UserModel {
  final String id;
  final String employeeId;
  final String fullName;
  final String role;
  final String? avatarUrl;

  const UserModel({
    required this.id,
    required this.employeeId,
    required this.fullName,
    required this.role,
    this.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String? ?? '',
      employeeId: json['employee_id'] as String? ?? json['employeeId'] as String? ?? '',
      fullName: json['full_name'] as String? ?? json['fullName'] as String? ?? '',
      role: json['role'] as String? ?? 'Operator',
      avatarUrl: json['avatar_url'] as String? ?? json['avatarUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'employee_id': employeeId,
      'full_name': fullName,
      'role': role,
      'avatar_url': avatarUrl,
    };
  }

  UserModel copyWith({
    String? id,
    String? employeeId,
    String? fullName,
    String? role,
    String? avatarUrl,
  }) {
    return UserModel(
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
      fullName: fullName ?? this.fullName,
      role: role ?? this.role,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}

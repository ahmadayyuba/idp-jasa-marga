import 'package:flutter/foundation.dart';
import '../../features/auth/data/models/user_model.dart';

class AuthSessionManager {
  AuthSessionManager._internal();
  static final AuthSessionManager instance = AuthSessionManager._internal();

  static const UserModel defaultUser = UserModel(
    id: 'usr_001',
    employeeId: '10700',
    fullName: 'Rahmat Rudiantono',
    role: 'Senior Traffic Controller',
  );

  // ValueNotifier untuk memantau status login dan data user aktif
  final ValueNotifier<UserModel?> currentUserNotifier =
      ValueNotifier<UserModel?>(defaultUser);

  ValueNotifier<UserModel?> get userNotifier => currentUserNotifier;

  UserModel? get currentUser => currentUserNotifier.value;

  bool get isLoggedIn => currentUserNotifier.value != null;

  void login({
    String employeeId = '10700',
    String? fullName,
    String role = 'Senior Traffic Controller',
    String? avatarUrl,
    UserModel? user,
  }) {
    if (user != null) {
      currentUserNotifier.value = user;
      return;
    }

    final trimmedId = employeeId.trim().isNotEmpty ? employeeId.trim() : '10700';
    final name = (fullName != null && fullName.trim().isNotEmpty)
        ? fullName.trim()
        : (trimmedId == '10700' ? 'Rahmat Rudiantono' : 'Employee $trimmedId');

    currentUserNotifier.value = UserModel(
      id: 'usr_$trimmedId',
      employeeId: trimmedId,
      fullName: name,
      role: role,
      avatarUrl: avatarUrl,
    );
  }

  void logout() {
    currentUserNotifier.value = null;
  }
}

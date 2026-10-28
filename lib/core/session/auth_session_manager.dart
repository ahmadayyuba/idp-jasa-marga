import 'package:flutter/foundation.dart';
import '../../features/auth/data/models/user_model.dart';

class AuthSessionManager {
  AuthSessionManager._internal();
  static final AuthSessionManager instance = AuthSessionManager._internal();

  // Ubah default user ke Anggun Windari
  final ValueNotifier<UserModel?> currentUserNotifier = ValueNotifier<UserModel?>(
    const UserModel(
      id: 'usr_001',
      employeeId: 'employeeId',
      fullName: 'Anggun Windari',
      role: 'Operator',
    ),
  );

  UserModel? get currentUser => currentUserNotifier.value;
  bool get isLoggedIn => currentUserNotifier.value != null;

  void login({required String employeeId, required String fullName}) {
    currentUserNotifier.value = UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      employeeId: employeeId,
      fullName: fullName,
      role: 'Operator',
    );
  }

  void logout() {
    currentUserNotifier.value = null;
  }
}
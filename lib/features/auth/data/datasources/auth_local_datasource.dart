import 'package:hive_flutter/hive_flutter.dart';
import 'package:prestamo_lite/core/error/exceptions.dart';
import 'package:prestamo_lite/features/auth/data/models/user_model.dart';
import 'package:prestamo_lite/core/common/entities/user.dart';

abstract interface class AuthLocalDataSource {
  Future<User> signUpWithEmailPassword(User user);

  Future<User> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<UserModel?> getCurrentUserData();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box<Map> _auth;

  static const String _currentUserKey = "current_user_id";

  Future<void> setCurrentUserId(int id) async {
    await _auth.put(_currentUserKey, {"id": id});
  }

  Future<int?> getCurrentUserId() async {
    final currentUserData = _auth.get("currentUser");
    return currentUserData?["id"] as int?;
  }

  AuthLocalDataSourceImpl(this._auth);

  static Future<AuthLocalDataSourceImpl> create() async {
    final box = await Hive.openBox<Map>("users");
    return AuthLocalDataSourceImpl(box);
  }

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      final userData = _auth.get(_currentUserKey);

      return UserModel.fromJson(
        Map<String, dynamic>.from(userData!),
      );
    } catch (e) {
      throw LocalException("Error al obtener el usuario actual: $e");
    }
  }

  @override
  Future<User> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = _auth.values
          .map((c) => UserModel.fromJson(Map<String, dynamic>.from(c)))
          .firstWhere(
            (user) =>
                user.email.trim() == email.trim() &&
                user.password.trim() == password.trim(),
            orElse: () => throw Exception("Credenciales incorrectas"),
          );
      await setCurrentUserId(user.id);
      print(user.id);
      return user;
    } catch (e) {
      throw LocalException(e.toString());
    }
  }

  @override
  Future<User> signUpWithEmailPassword(User user) async {
    try {
      await _auth.put(
        user.id,
        UserModel.fromEntity(user).toJson(),
      );

      return user;
    } catch (e) {
      throw LocalException(e.toString());
    }
  }
}

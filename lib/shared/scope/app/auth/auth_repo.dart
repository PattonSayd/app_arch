import 'user_data.dart';

abstract interface class AuthRepository {
  UserData? get user;
  Stream<UserData?> get userChanges;

  Future<void> init();
  Future<void> login(String name);
  Future<void> logout();
  Future<void> dispose();
}

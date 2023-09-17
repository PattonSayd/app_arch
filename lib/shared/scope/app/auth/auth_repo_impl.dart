import 'dart:async';

import 'package:app_arch/shared/scope/app/auth/auth_repo.dart';
import 'package:app_arch/shared/scope/app/auth/user_data.dart';

class AuthRepositoryImpl implements AuthRepository {
  UserData? _user;
  late final StreamController<UserData?> _controller;

  @override
  UserData? get user => _user;

  @override
  Stream<UserData?> get userChanges => _controller.stream;

  @override
  Future<void> init() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    _controller = StreamController<UserData?>();
  }

  @override
  Future<void> login(String name) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));

    _setUser(UserData(name: name));
  }

  @override
  Future<void> logout() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));

    _setUser(null);
  }

  @override
  Future<void> dispose() async {
    await _controller.close();
  }

  void _setUser(UserData? user) {
    _user = user;
    _controller.add(user);
  }
}

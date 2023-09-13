import 'package:flutter/material.dart';

import 'package:app_arch/shared/scope/app/app_scope/auth/user_data.dart';

class Auth extends StatefulWidget {
  const Auth({
    Key? key,
    required this.notAuthorized,
    required this.authorized,
  }) : super(key: key);

  final Widget Function(BuildContext context) notAuthorized;
  final Widget Function(BuildContext context, UserData user) authorized;

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  UserData? user;

  @override
  void initState() {
    super.initState();

    Future<void>.delayed(const Duration(milliseconds: 3000)).then(
      (value) => setState(
        () => user = const UserData(name: 'User 1'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = this.user;
    return user == null
        ? widget.notAuthorized(context)
        : widget.authorized(context, user);
  }
}

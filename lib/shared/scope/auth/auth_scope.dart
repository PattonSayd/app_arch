import 'package:app_arch/shared/scope/app/auth/user_data.dart';
import 'package:flutter/material.dart';

class AuthScope extends StatefulWidget {
  const AuthScope({
    Key? key,
    required this.notAuthorized,
    required this.authorized,
  }) : super(key: key);

  final Widget Function(BuildContext context) notAuthorized;
  final Widget Function(BuildContext context, UserData user) authorized;

  @override
  State<AuthScope> createState() => _AuthScopeState();
}

class _AuthScopeState extends State<AuthScope> {
  UserData? user;

  @override
  void initState() {
    super.initState();

    Future<void>.delayed(const Duration(milliseconds: 1000)).then((_) {
      setState(() => user = const UserData(name: 'User 1'));
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = this.user;
    return user == null
        ? widget.notAuthorized(context)
        : widget.authorized(context, user);
  }
}

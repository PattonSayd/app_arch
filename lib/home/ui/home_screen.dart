import 'package:app_arch/shared/scope/app/auth/user_data.dart';
import 'package:flutter/material.dart';

import 'package:app_arch/shared/const/strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserData user;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(Strings.homeTitle),
        ),
        body: Center(
          child: _Greetings(user.name),
        ),
      );
}

class _Greetings extends StatelessWidget {
  final String name;

  const _Greetings(this.name, [Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(
          'Hello $name',
          textAlign: TextAlign.center,
        ),
      );
}

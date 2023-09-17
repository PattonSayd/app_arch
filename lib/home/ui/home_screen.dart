import 'package:app_arch/shared/scope/app/app_scope/app_scope.dart';
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
        body: ListView(
          children: [
            _Greetings(user.name),
            const _AppSettingsView(),
          ],
        ),
      );
}

class _Greetings extends StatelessWidget {
  final String name;

  const _Greetings(this.name);

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(
          'Hello $name',
          textAlign: TextAlign.center,
        ),
      );
}

class _AppSettingsView extends StatelessWidget {
  const _AppSettingsView();

  @override
  Widget build(BuildContext context) {
    final settings = AppScope.of(context).initialAppSettings;

    return Text('App someProperty: ${settings.someProperty}');
  }
}

import 'package:app_arch/shared/const/strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(Strings.homeTitle),
        ),
        body: const Center(
          child: _Greetings(),
        ),
      );
}

class _Greetings extends StatelessWidget {
  const _Greetings();

  @override
  Widget build(BuildContext context) => const ListTile(
        title: Text(
          'Hello world',
          textAlign: TextAlign.center,
        ),
      );
}

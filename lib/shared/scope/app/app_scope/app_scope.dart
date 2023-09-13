import 'package:flutter/material.dart';

class AppScope extends StatefulWidget {
  const AppScope({
    Key? key,
    required this.init,
    required this.initialization,
    required this.initialized,
  }) : super(key: key);

  final Future<void> Function() init;
  final Widget Function(BuildContext ctx) initialization;
  final Widget Function(BuildContext ctx) initialized;

  @override
  State<AppScope> createState() => _AppScopeState();
}

class _AppScopeState extends State<AppScope> {
  bool initizlized = false;

  @override
  void initState() {
    super.initState();

    widget.init().then((value) => setState(() => initizlized = true));
  }

  @override
  Widget build(BuildContext context) {
    return !initizlized
        ? widget.initialization(context)
        : widget.initialized(context);
  }
}

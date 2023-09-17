import 'package:app_arch/shared/scope/app/app_scope/app_scope_dependencies.dart';
import 'package:app_arch/shared/scope/app/app_scope/app_scope_state.dart';
import 'package:flutter/material.dart';

class AppScope extends StatefulWidget {
  const AppScope({
    Key? key,
    required this.init,
    required this.initialization,
    required this.initialized,
  }) : super(key: key);

  final Stream<AppScopeState> Function() init;
  final Widget Function(BuildContext ctx, AppScopeState state) initialization;
  final Widget Function(BuildContext ctx) initialized;

  static AppScopeDependencies of(BuildContext ctx) =>
      switch (ctx.findAncestorStateOfType<_AppScopeState>()?.state) {
        AppScopeInitialized x => x.appScopeDependencies,
        _ => throw Exception('AppScope not found')
      };

  @override
  State<AppScope> createState() => _AppScopeState();
}

class _AppScopeState extends State<AppScope> {
  AppScopeState state = const AppScopeIdle();

  @override
  void initState() {
    super.initState();

    widget.init().listen((state) {
      setState(() => this.state = state);

      if (state is AppScopeFailure) {
        Error.throwWithStackTrace(state.error, state.stackTrace);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('$state');
    return state is! AppScopeInitialized
        ? widget.initialization(context, state)
        : widget.initialized(context);
  }
}

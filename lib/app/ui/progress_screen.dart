import 'package:app_arch/shared/const/sizes.dart';
import 'package:app_arch/shared/scope/app/app_scope/app_scope_state.dart';
import 'package:app_arch/shared/utils/gap.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({
    super.key,
    required this.state,
  });

  final AppScopeState state;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final (bg, color) = switch (state) {
      AppScopeFailure() => (colorScheme.error, colorScheme.onError),
      _ => (colorScheme.background, colorScheme.onBackground)
    };

    final content = switch (state) {
      AppScopeInitialization(:final step) => Center(
          child: Text(step),
        ),
      AppScopeFailure(
        :final message,
        :final error,
        :final stackTrace,
      ) =>
        !kDebugMode
            ? Center(
                child: Text(message),
              )
            : ListView(
                children: [
                  Text(message),
                  const HeightGap(),
                  Text(error.toString()),
                  const HeightGap(),
                  Text(stackTrace.toString()),
                ],
              ),
      _ => SizedBox.fromSize(),
    };

    return Scaffold(
      backgroundColor: bg,
      body: DefaultTextStyle(
        style: TextStyle(color: color),
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpacing),
          child: content,
        ),
      ),
    );
  }
}

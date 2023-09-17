import 'package:app_arch/shared/scope/app/app_scope/app_scope_dependencies.dart';

sealed class AppScopeState {
  const AppScopeState();
}

final class AppScopeIdle extends AppScopeState {
  const AppScopeIdle();
}

final class AppScopeInitialization extends AppScopeState {
  const AppScopeInitialization(this.step);
  final String step;
}

final class AppScopeInitialized extends AppScopeState {
  const AppScopeInitialized(this.appScopeDependencies);

  final AppScopeDependencies appScopeDependencies;
}

final class AppScopeFailure extends AppScopeState {
  AppScopeFailure(this.message, this.error, this.stackTrace);

  final String message;
  final Object error;
  final StackTrace stackTrace;
}

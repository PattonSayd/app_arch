import 'package:app_arch/shared/scope/app/app_scope/app_scope_dependencies.dart';
import 'package:app_arch/shared/scope/app/app_scope/app_scope_state.dart';
import 'package:app_arch/shared/scope/app/app_settings/app_settings_data.dart';
import 'package:app_arch/shared/scope/app/app_settings/app_settings_repo.dart';
import 'package:app_arch/shared/scope/app/app_settings/app_settings_repo_impl.dart';
import 'package:app_arch/shared/scope/app/app_storage/app_storage_repo.dart';
import 'package:app_arch/shared/scope/app/app_storage/app_storage_repo_impl.dart';
import 'package:app_arch/shared/scope/app/auth/auth_repo.dart';
import 'package:app_arch/shared/scope/app/auth/auth_repo_impl.dart';

final class AppScopeDependenciesImpl implements AppScopeDependencies {
  AppScopeDependenciesImpl._(
    this.appStorageRepository,
    this.appSettingsRepository,
    this.initialAppSettings,
    this.authRepository,
  );

  @override
  final AppStorageRepository appStorageRepository;
  @override
  final AppSettingsRepository appSettingsRepository;
  @override
  final AppSettingsData initialAppSettings;
  @override
  final AuthRepository authRepository;

  static Stream<AppScopeState> init() async* {
    AppStorageRepository? appStorageRepository;
    AppSettingsRepository? appSettingsRepository;
    AuthRepository? authRepository;
    try {
      yield const AppScopeInitialization('storage');
      appStorageRepository = const AppStorageRepositoryImpl();
      await appStorageRepository.init();

      yield const AppScopeInitialization('settings');
      appSettingsRepository = const AppSettingsRepositoryImpl();
      await appSettingsRepository.init();
      final initialAppSettings = await appSettingsRepository.load();

      yield const AppScopeInitialization('auth');
      authRepository = AuthRepositoryImpl();
      await authRepository.init();

      yield AppScopeInitialized(
        AppScopeDependenciesImpl._(
          appStorageRepository,
          appSettingsRepository,
          initialAppSettings,
          authRepository,
        ),
      );
    } on Object catch (error, stackTrace) {
      yield AppScopeFailure('Something went wrong', error, stackTrace);

      await Future.wait(
        [
          appStorageRepository?.dispose(),
          appSettingsRepository?.dispose(),
          authRepository?.dispose(),
        ].whereType(),
      );
    }
  }

  @override
  Future<void> dispose() async {
    Future.wait([
      appStorageRepository.dispose(),
      appSettingsRepository.dispose(),
      authRepository.dispose(),
    ]);
  }
}

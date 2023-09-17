import 'package:app_arch/shared/scope/app/app_scope/app_scope_dependencies.dart';
import 'package:app_arch/shared/scope/app/app_settings/app_settings_data.dart';
import 'package:app_arch/shared/scope/app/app_settings/app_settings_repo.dart';
import 'package:app_arch/shared/scope/app/app_storage/app_storage_repo.dart';
import 'package:app_arch/shared/scope/app/auth/auth_repo.dart';

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

  static Future<void> init() async {}

  @override
  Future<void> dispose() async {
    Future.wait([
      appStorageRepository.dispose(),
      appSettingsRepository.dispose(),
      authRepository.dispose(),
    ]);
  }
}

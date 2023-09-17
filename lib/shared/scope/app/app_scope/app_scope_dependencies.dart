import 'package:app_arch/shared/scope/app/app_settings/app_settings_data.dart';
import 'package:app_arch/shared/scope/app/app_settings/app_settings_repo.dart';
import 'package:app_arch/shared/scope/app/app_storage/app_storage_repo.dart';
import 'package:app_arch/shared/scope/app/auth/auth_repo.dart';

abstract interface class AppScopeDependencies {
  AppStorageRepository get appStorageRepository;
  AppSettingsRepository get appSettingsRepository;
  AppSettingsData get initialAppSettings;
  AuthRepository get authRepository;

  Future<void> dispose();
}

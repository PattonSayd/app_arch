import 'package:app_arch/shared/scope/app/app_settings/app_settings_data.dart';

abstract interface class AppSettingsRepository {
  Future<void> init();
  Future<AppSettingsData> load();
  Future<void> save(AppSettingsData settings);
  Future<void> dispose();
}

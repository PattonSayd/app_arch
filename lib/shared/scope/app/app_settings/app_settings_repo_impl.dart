import 'package:app_arch/shared/scope/app/app_settings/app_settings_data.dart';
import 'package:app_arch/shared/scope/app/app_settings/app_settings_repo.dart';

class AppSettingsRepositoryImpl implements AppSettingsRepository {
  const AppSettingsRepositoryImpl();

  @override
  Future<void> init() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<AppSettingsData> load() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return const AppSettingsData(someProperty: true);
  }

  @override
  Future<void> save(AppSettingsData settings) async {
    // save
  }

  @override
  Future<void> dispose() async {}
}

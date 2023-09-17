import 'package:app_arch/shared/scope/app/app_storage/app_storage_repo.dart';

class AppStorageRepositoryImpl implements AppStorageRepository {
  const AppStorageRepositoryImpl();
  @override
  Future<void> dispose() async {}

  @override
  Future<void> init() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
  }
}

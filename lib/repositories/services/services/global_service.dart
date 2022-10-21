import 'package:mvvm/repositories/storage/services/global_storage_service.dart';

class GlobalService{
  final GlobalStorageService _storageService = GlobalStorageService();

  Future<String?> getLanguage() => _storageService.getLanguage();
  Future<bool> saveLanguage(String language) => _storageService.saveLanguage(language);
}
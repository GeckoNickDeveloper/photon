import 'package:photon/services/local_storage_service.dart';

class Settings {
  static Settings? _instance;
  bool deleteOnUpload;

  Settings._() : deleteOnUpload = false;

  factory Settings() {
    _instance ??= Settings._();
    return _instance!; 
  }

  Future<void> init() async {
    final localStorageService = LocalStorageService();
    
    // Assign defaul values to settings
    deleteOnUpload = (await localStorageService.readToken() == null);
    // uuid = await localStorageService.readUUID();
    // uuid ??= const Uuid().v8();
    // await localStorageService.writeUUID(uuid!);
  }
}
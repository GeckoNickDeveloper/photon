import 'package:photon/services/local_storage_service.dart';
import 'package:uuid/uuid.dart';

class DeviceInfos {
  static DeviceInfos? _instance;
  String? uuid;

  DeviceInfos._();

  factory DeviceInfos() {
    _instance ??= DeviceInfos._();
    return _instance!; 
  }

  Future<void> init() async {
    final localStorageService = LocalStorageService();
    
    // Assign UUID if not existing
    uuid = await localStorageService.readUUID();
    uuid ??= const Uuid().v8();
    await localStorageService.writeUUID(uuid!);
  }
}
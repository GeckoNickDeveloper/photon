import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  // Private static instance variable
  static LocalStorageService? _instance;

  // Private constructor
  LocalStorageService._();

  // Factory constructor to return the singleton instance
  factory LocalStorageService() {
    // If the instance is null, create a new one; otherwise, return the existing instance
    _instance ??= LocalStorageService._();
    return _instance!;
  }

  // Local Storage methods
  /// UUID
  Future<String?> readUUID() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    String? value = sp.getString('uuid');
    return value;
  }

  Future<bool> writeUUID(String uuid) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    bool value = await sp.setString('uuid', uuid);
    return value;
  }

  Future<bool> removeUUID() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    bool value = await sp.remove('uuid');
    return value;
  }

  /// Settings - Delete On Update
  Future<bool?> readDeleteOnUpdate() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    bool? value = sp.getBool('settings-deleteOnUpdate');
    return value;
  }

  Future<bool> writeDeleteOnUpdate(bool deleteOnUpload) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    bool value = await sp.setBool('settings-deleteOnUpdate', deleteOnUpload);
    return value;
  }

  Future<bool> removeDeleteOnUpdate() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    bool value = await sp.remove('settings-deleteOnUpdate');
    return value;
  }
}
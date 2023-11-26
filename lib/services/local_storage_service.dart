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

  /// Token
  Future<String?> readToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    String? value = sp.getString('token');
    return value;
  }

  Future<bool> writeToken(String uuid) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    bool value = await sp.setString('token', uuid);
    return value;
  }

  Future<bool> removeToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    bool value = await sp.remove('token');
    return value;
  }

  /// TODO create API for setting
}
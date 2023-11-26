import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  // Private static instance variable
  static PermissionService? _instance;

  // Permissions
  PermissionStatus? camera;

  // Private constructor
  PermissionService._();

  // Factory constructor to return the singleton instance
  factory PermissionService() {
    // If the instance is null, create a new one; otherwise, return the existing instance
    _instance ??= PermissionService._();
    return _instance!;
  }

  // Methods
  Future<void> _update() async {
    camera = await Permission.camera.status;
  }

  /// Camera permission
  Future<void> askCameraPermission() async {
    var status = await Permission.camera.status;

    if (status.isDenied) {
      status = await Permission.camera.request();
    }

    await _update();
  }
}
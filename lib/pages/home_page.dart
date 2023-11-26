import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photon/pages/scan_qr_page.dart';
import 'package:photon/services/permission_service.dart';

class HomePage extends ConsumerWidget {
  final String title;
  final PermissionService _permissionService = PermissionService();

  HomePage({super.key, required this.title});

  // Build method
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              ElevatedButton(
                onPressed: () {
                  if (_permissionService.camera == PermissionStatus.granted) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ScanQRPage(),
                      ),
                    );
                  }
                },
                child: const Row(
                  children: [
                    Text('SCAN QR CODE'),
                    Icon(Icons.qr_code_scanner),
                  ]
                )
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => askPermission(),
        child: const Icon(Icons.perm_camera_mic),
      ),
    );
  }

  void askPermission() async {
    await _permissionService.askCameraPermission();
  }
}
